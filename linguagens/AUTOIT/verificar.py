#!/usr/bin/env python3
"""Verificacao estatica dos scripts AutoIt v3 da pasta AUTOIT.

Nao executa AutoIt (nao existe runtime para Linux). Faz:
  1. balanceamento de blocos (If/EndIf, For/Next, While/WEnd, Do/Until,
     Func/EndFunc, Select/EndSelect, Switch/EndSwitch, #cs/#ce);
  2. variaveis usadas vs. declaradas/atribuidas/parametros/macros;
  3. funcoes chamadas vs. definidas no arquivo ou conhecidas (nativas/UDF);
  4. constantes usadas vs. constantes das bibliotecas incluídas;
  5. parenteses/aspas balanceados por linha;
  6. ausencia de marcadores de placeholder e de palavras-chave invalidas.
"""
import re
import sys
import os
import hashlib

PASTA = "/home/ubuntu/work/out/AUTOIT"

# Funcoes nativas do AutoIt v3 usadas nos arquivos.
NATIVAS = {
    "abs", "int", "round", "mod", "sqrt", "sin", "cos", "tan", "log", "exp",
    "random", "stringlen", "stringupper", "stringlower", "stringleft",
    "stringright", "stringmid", "stringinstr", "stringreplace", "stringsplit",
    "stringstripws", "stringformat", "stringregexpreplace", "number", "isnumber",
    "isstring", "isarray", "iskeyword", "isint", "vargettype", "ubound", "redim",
    "msgbox", "consolewrite", "fileopen", "fileclose", "filereadline",
    "filewriteline", "fileexists", "filedelete", "setError".lower(), "onexit",
    "onautoitexitregister", "guicreate", "guictrlcreatebutton",
    "guictrlcreatelabel", "guictrlsetdata", "guictrlread", "guisetstate",
    "guigetmsg", "guidelete", "sleep", "exit", "exitloop", "continueloop",
    "return", "true", "false", "null", "default",
}

# Funcoes de bibliotecas padrao (UDF) e o include que as fornece.
UDFS = {
    "_arraysort": "Array.au3",
    "_arraytostring": "Array.au3",
    "_arraydisplay": "Array.au3",
    "_arrayadd": "Array.au3",
    "_arrayreverse": "Array.au3",
}

# Constantes de bibliotecas padrao e o include que as fornece.
CONSTANTES = {
    "$mb_ok": "MsgBoxConstants.au3",
    "$mb_iconinformation": "MsgBoxConstants.au3",
    "$mb_iconwarning": "MsgBoxConstants.au3",
    "$mb_yesno": "MsgBoxConstants.au3",
    "$idok": "MsgBoxConstants.au3",
    "$fo_read": "FileConstants.au3",
    "$fo_overwrite": "FileConstants.au3",
    "$fo_append": "FileConstants.au3",
    "$str_nocount": "StringConstants.au3",
    "$str_stripall": "StringConstants.au3",
    "$gui_event_close": "GUIConstantsEx.au3",
    "$sw_show": None,
}

PALAVRAS_INVALIDAS = ["end if", "end func", "end while", "end select",
                      "elseif(", "function "]


def sem_comentario(linha):
    """Remove comentario de fim de linha, respeitando aspas duplas."""
    saida = []
    dentro = False
    i = 0
    while i < len(linha):
        c = linha[i]
        if c == '"':
            dentro = not dentro
            saida.append(c)
        elif c == ";" and not dentro:
            break
        else:
            saida.append(c)
        i += 1
    return "".join(saida).strip()


def mascarar_strings(linha):
    """Troca o conteudo de literais "..." por espacos (mantem as aspas)."""
    saida = []
    dentro = False
    for c in linha:
        if c == '"':
            dentro = not dentro
            saida.append(c)
        else:
            saida.append(" " if dentro else c)
    return "".join(saida)


def analisar(caminho):
    erros = []
    avisos = []
    with open(caminho, "rb") as fh:
        bruto = fh.read()

    tem_bom = bruto.startswith(b"\xef\xbb\xbf")
    texto = bruto.decode("utf-8-sig")
    linhas = texto.splitlines()

    includes = set()
    declaradas = set()
    usadas = set()
    funcoes = {}
    chamadas = set()
    pilha = []
    em_bloco_cs = False
    nome_funcao_atual = None
    params_por_funcao = {}
    total_if_bloco = 0

    for n, linha in enumerate(linhas, start=1):
        low_raw = linha.strip().lower()

        if em_bloco_cs:
            if low_raw.startswith("#ce") or low_raw.startswith("#comments-end"):
                em_bloco_cs = False
                if pilha and pilha[-1][0] == "cs":
                    pilha.pop()
            continue
        if low_raw.startswith("#cs") or low_raw.startswith("#comments-start"):
            em_bloco_cs = True
            pilha.append(("cs", n))
            continue
        if low_raw.startswith("#include"):
            m = re.search(r"#include\s*[<\"]\s*([^>\"]+)\s*[>\"]", linha, re.I)
            if not m:
                erros.append((n, "diretiva #include malformada"))
            else:
                includes.add(m.group(1).strip())
            continue
        if low_raw.startswith("#"):
            continue  # outras diretivas (#RequireAdmin, #NoTrayIcon...)

        limpa = sem_comentario(linha)
        if not limpa:
            continue
        low = limpa.lower()

        mascara = mascarar_strings(limpa)
        lowm = mascara.lower()

        # Aspas e parenteses balanceados
        if limpa.count('"') % 2 != 0:
            erros.append((n, "numero impar de aspas duplas"))
        if limpa.count("(") != limpa.count(")"):
            erros.append((n, "parenteses desbalanceados"))

        # Palavras-chave invalidas
        for invalida in PALAVRAS_INVALIDAS:
            if low.startswith(invalida):
                erros.append((n, "palavra-chave invalida: %r" % invalida))

        # Blocos
        if re.match(r"^func\s+\w+", low):
            m = re.match(r"^func\s+(\w+)\s*\((.*)\)\s*$", limpa, re.I)
            if not m:
                erros.append((n, "cabecalho Func malformado"))
                continue
            nome = m.group(1).lower()
            if nome in funcoes:
                erros.append((n, "funcao %s definida duas vezes" % nome))
            params = m.group(2).strip()
            funcoes[nome] = n
            params_por_funcao[nome] = params
            nome_funcao_atual = nome
            for p in params.split(","):
                p = p.strip()
                if not p:
                    continue
                p = re.sub(r"^(byref|const)\s+", "", p, flags=re.I)
                p = p.split("=")[0].strip()
                if p.startswith("$"):
                    declaradas.add(p.lower())
                else:
                    erros.append((n, "parametro sem $ em Func %s" % nome))
            pilha.append(("func", n))
            continue
        if low.startswith("endfunc"):
            if not pilha or pilha[-1][0] != "func":
                erros.append((n, "EndFunc sem Func correspondente"))
            else:
                pilha.pop()
            nome_funcao_atual = None
            continue

        if re.match(r"^if\b", low):
            if " then" not in low:
                erros.append((n, "If sem Then"))
                continue
            depois = limpa[low.index(" then") + 5:].strip()
            if depois == "":
                total_if_bloco += 1
                pilha.append(("if", n))
            continue
        if re.match(r"^elseif\b", low):
            if not pilha or pilha[-1][0] != "if":
                erros.append((n, "ElseIf fora de bloco If"))
            continue
        if re.match(r"^else\b", low):
            if not pilha or pilha[-1][0] != "if":
                erros.append((n, "Else fora de bloco If"))
            continue
        if low.startswith("endif"):
            if not pilha or pilha[-1][0] != "if":
                erros.append((n, "EndIf sem If correspondente"))
            else:
                pilha.pop()
            continue

        if re.match(r"^for\b", low):
            if not re.search(r"\bto\b", low):
                erros.append((n, "For sem To"))
            m = re.match(r"^for\s+(\$\w+)", limpa, re.I)
            if m:
                declaradas.add(m.group(1).lower())
            pilha.append(("for", n))
            continue
        if low.startswith("next"):
            if not pilha or pilha[-1][0] != "for":
                erros.append((n, "Next sem For correspondente"))
            else:
                pilha.pop()
            continue

        if re.match(r"^while\b", low):
            pilha.append(("while", n))
            continue
        if low.startswith("wend"):
            if not pilha or pilha[-1][0] != "while":
                erros.append((n, "WEnd sem While correspondente"))
            else:
                pilha.pop()
            continue

        if re.match(r"^do\b", low):
            pilha.append(("do", n))
            continue
        if re.match(r"^until\b", low):
            if not pilha or pilha[-1][0] != "do":
                erros.append((n, "Until sem Do correspondente"))
            else:
                pilha.pop()
            continue

        if re.match(r"^select\b", low):
            pilha.append(("select", n))
            continue
        if low.startswith("endselect"):
            if not pilha or pilha[-1][0] != "select":
                erros.append((n, "EndSelect sem Select correspondente"))
            else:
                pilha.pop()
            continue
        if re.match(r"^case\b", low):
            if not pilha or pilha[-1][0] not in ("select", "switch"):
                erros.append((n, "Case fora de Select/Switch"))
            continue

        if re.match(r"^switch\b", low):
            pilha.append(("switch", n))
            continue
        if low.startswith("endswitch"):
            if not pilha or pilha[-1][0] != "switch":
                erros.append((n, "EndSwitch sem Switch correspondente"))
            else:
                pilha.pop()
            continue

        # Declaracoes e atribuicoes
        m = re.match(r"^(local|global|dim|static)\s+(const\s+)?(\$\w+)", limpa, re.I)
        if m:
            declaradas.add(m.group(3).lower())
        m = re.match(r"^redim\s+(\$\w+)", limpa, re.I)
        if m:
            declaradas.add(m.group(1).lower())
        for m in re.finditer(r"(\$\w+)\s*(=|\+=|-=|\*=|/=)\s*[^=]", limpa):
            declaradas.add(m.group(1).lower())
        # declaracoes multiplas: Local $a = 1, $b = 2
        for m in re.finditer(r",\s*(\$\w+)\s*=", limpa):
            declaradas.add(m.group(1).lower())

        # Chamadas de funcao
        for m in re.finditer(r"\b([A-Za-z_]\w*)\s*\(", mascara):
            nome = m.group(1).lower()
            if nome in ("if", "elseif", "while", "until", "switch", "select",
                        "case", "func", "for", "and", "or", "not", "return"):
                continue
            chamadas.add((nome, n))

        # Variaveis usadas
        for m in re.finditer(r"\$(\w+)", mascara):
            usadas.add((m.group(0).lower(), n))

    if em_bloco_cs:
        erros.append((len(linhas), "bloco #cs sem #ce"))
    for tipo, n in pilha:
        erros.append((n, "bloco %s nao fechado" % tipo))

    # Variaveis: declaradas, parametros de qualquer funcao, macros
    for nome, chamada_linha in sorted(chamadas):
        if nome in funcoes or nome in NATIVAS:
            continue
        if nome in UDFS:
            if UDFS[nome] not in includes:
                erros.append((chamada_linha, "UDF %s exige #include <%s>" % (nome, UDFS[nome])))
            continue
        erros.append((chamada_linha, "funcao desconhecida: %s()" % nome))

    # Variaveis nao declaradas
    for var, n in sorted(usadas):
        if var in declaradas:
            continue
        if var in CONSTANTES:
            inc = CONSTANTES[var]
            if inc is not None and inc not in includes:
                erros.append((n, "constante %s exige #include <%s>" % (var, inc)))
            continue
        erros.append((n, "variavel nao declarada: %s" % var))

    # Constantes com include obrigatorio
    for var, n in sorted(usadas):
        if var in CONSTANTES and CONSTANTES[var] is not None:
            if CONSTANTES[var] not in includes:
                erros.append((n, "constante %s sem include %s" % (var, CONSTANTES[var])))

    # Placeholders
    for n, linha in enumerate(linhas, start=1):
        low = linha.lower()
        if ("sintaxe para" in low or "placeholder" in low
                or re.search(r"\bTODO\b", linha) or re.search(r"\bFIXME\b", linha)):
            erros.append((n, "marcador de placeholder: %r" % linha.strip()[:60]))
        if re.search(r"^\s*--", linha):
            erros.append((n, "comentario em estilo Lua/SQL (--): %r" % linha.strip()[:40]))

    corpo = "\n".join(sem_comentario(l) for l in linhas if sem_comentario(l))
    resumo = {
        "arquivo": os.path.basename(caminho),
        "linhas": len(linhas),
        "bom": tem_bom,
        "includes": sorted(includes),
        "funcoes": sorted(funcoes),
        "if_blocos": total_if_bloco,
        "erros": erros,
        "hash": hashlib.sha256(corpo.encode()).hexdigest()[:12],
    }
    return resumo


def main():
    arquivos = sorted(f for f in os.listdir(PASTA) if f.endswith(".au3"))
    if len(arquivos) != 20:
        print("AVISO: esperados 20 scripts .au3, encontrados %d" % len(arquivos))
    total_erros = 0
    hashes = {}
    for nome in arquivos:
        r = analisar(os.path.join(PASTA, nome))
        hashes.setdefault(r["hash"], []).append(nome)
        estado = "OK " if not r["erros"] else "ERRO"
        print("%s %-18s linhas=%-4d BOM=%-5s funcoes=%-2d if=%-2d includes=%s"
              % (estado, r["arquivo"], r["linhas"], r["bom"], len(r["funcoes"]),
                 r["if_blocos"], ",".join(r["includes"]) or "-"))
        for n, msg in r["erros"]:
            total_erros += 1
            print("     linha %d: %s" % (n, msg))
    dup = {h: v for h, v in hashes.items() if len(v) > 1}
    print()
    print("Scripts analisados: %d" % len(arquivos))
    print("Erros encontrados: %d" % total_erros)
    print("Duplicados: %s" % (dup if dup else "nenhum"))
    return 1 if total_erros else 0


if __name__ == "__main__":
    sys.exit(main())

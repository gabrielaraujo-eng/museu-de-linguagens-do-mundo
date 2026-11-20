#!/usr/bin/env bash
# Compila e executa cada arquivo .aj da pasta, isoladamente, com ajc 1.9.22.1.
AJTOOLS=/home/ubuntu/work/aspectj/aspectjtools-1.9.22.1.jar
AJRT=/home/ubuntu/work/aspectj/aspectjrt-1.9.22.1.jar
DIR=$(cd "$(dirname "$0")" && pwd)
OUT=/tmp/ajout
rm -rf "$OUT"; mkdir -p "$OUT"
ok=0; fail=0
declare -A MAIN=(
  [exemplo_1]=Ex1OlaMundo [exemplo_2]=Ex2Conta [exemplo_3]=Ex3Cliente
  [exemplo_4]=Ex4Calculadora [exemplo_5]=Ex5Servico [exemplo_6]=Ex6Pedido
  [exemplo_7]=Ex7Principal [exemplo_8]=Ex8Visitante [exemplo_9]=Ex9Pedido
  [exemplo_10]=Ex10Tarefa
  [exercicio_1]=Exer1Relogio [exercicio_2]=Exer2Busca [exercicio_3]=Exer3Estoque
  [exercicio_4]=Exer4Fibonacci [exercicio_5]=Exer5ContaBancaria
  [exercicio_6]=Exer6Conversor [exercicio_7]=Exer7Sistema [exercicio_8]=Exer8Produto
  [exercicio_9]=Exer9Aluno [exercicio_10]=Exer10Relatorio
)
for f in "$DIR"/*.aj; do
  base=$(basename "$f" .aj)
  d="$OUT/$base"; mkdir -p "$d"
  echo "=============== $base.aj ==============="
  if java -cp "$AJTOOLS" org.aspectj.tools.ajc.Main -source 17 -target 17 -cp "$AJRT" -d "$d" "$f" 2>&1; then
    echo "--- ajc OK ---"
    java -cp "$d:$AJRT" "${MAIN[$base]}" 2>&1
    echo "--- exec exit=$? ---"
    ok=$((ok+1))
  else
    echo "--- ajc FALHOU ---"
    fail=$((fail+1))
  fi
done
echo "RESUMO: ok=$ok falhas=$fail"

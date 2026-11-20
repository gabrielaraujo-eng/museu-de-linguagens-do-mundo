# Apache HTTP Server - configuração (APACHECONF)

**Linhagem:** Apache HTTP Server, versão 1.0 de 1995 (derivada do NCSA HTTPd)
**Linguagem desta pasta:** linguagem de configuração do Apache HTTP Server 2.4, na sintaxe de arquivos `httpd.conf`/`apache2.conf`

## Descrição

Apache HTTP Server não é uma linguagem de programação: é um servidor web cuja configuração é uma linguagem declarativa própria, lida na inicialização e recarregada com `apachectl graceful`. Um arquivo de configuração é uma sequência de diretivas, uma por linha, com nome e argumentos separados por espaço, comentários iniciados por `#` e seções delimitadas por `<Diretiva>` ... `</Diretiva>`. Não há variáveis no sentido das linguagens imperativas, nem laços, nem funções; o que existe são diretivas de contexto (servidor, host virtual, diretório, `.htaccess`), herança e sobreposição entre contextos, e módulos que acrescentam diretivas novas.

Esta pasta documenta a linha 2.4, cuja sintaxe difere da 2.2 no controle de acesso: `Require` substitui `Order`/`Allow`/`Deny`, e `NameVirtualHost` deixou de ser necessário. Os arquivos foram validados com o Apache HTTP Server 2.4.58.

## Arquivos

Cada tópico aparece em duas extensões, `exemplo_N.conf` e `exemplo_N.apacheconf`, com exatamente o mesmo conteúdo; o mesmo vale para os exercícios. As extensões não mudam a sintaxe e não são prescritas pelo Apache:

- `.conf` é a extensão usada pelo próprio servidor: no Debian/Ubuntu, os arquivos de `/etc/apache2/sites-available/` e `/etc/apache2/conf-available/` terminam assim e são ativados por links simbólicos em `sites-enabled/` e `conf-enabled/`, carregados por `IncludeOptional`.
- `.apacheconf` é a convenção dos realçadores de sintaxe (`apacheconf` é o nome do analisador léxico no Pygments e no highlight.js), usada aqui para marcar os arquivos desta pasta como configuração Apache.

Manter os dois arquivos idênticos evita sugerir dialetos distintos: o conteúdo é o mesmo, só o nome muda.

### Exemplos

1. `exemplo_1` — site estático mínimo: `DocumentRoot`, `<Directory>`, `Require all granted`, `DirectoryIndex`
2. `exemplo_2` — dois `<VirtualHost>` no mesmo IP e porta, com `ServerName` e `ServerAlias`
3. `exemplo_3` — `Options`, `AllowOverride` e proteção de subdiretório com `Require all denied`
4. `exemplo_4` — `Alias` para diretório fora do `DocumentRoot` e o `<Directory>` correspondente
5. `exemplo_5` — `LogLevel`, `LogFormat` com tempo de resposta e dois `CustomLog`
6. `exemplo_6` — `RewriteEngine`, `RewriteCond`, `RewriteRule` e `RewriteBase`
7. `exemplo_7` — `Redirect` com 301, 302 e 410, e `RedirectMatch` com expressão regular
8. `exemplo_8` — `Header always set`, `append`, `unset` e `edit`
9. `exemplo_9` — `AddType`, `AddCharset`, `AddDefaultCharset` e `RemoveType`
10. `exemplo_10` — HTTPS: `SSLEngine`, certificado, `SSLProtocol` e HSTS, com redirecionamento da porta em texto claro

### Exercícios

Cada exercício é uma configuração completa e distinta, que resolve a tarefa descrita no cabeçalho do arquivo:

1. `exercicio_1` — publicar a documentação em `/var/www/museu/docs`, sem listagem, com `ErrorDocument`
2. `exercicio_2` — dois acervos em um servidor, com raízes e logs independentes
3. `exercicio_3` — bloquear `.git`, `.env`, `.htaccess` e os próprios `.conf` com `<FilesMatch>` e `<DirectoryMatch>`
4. `exercicio_4` — migração de URLs antigas com `Redirect` e `RedirectMatch` 301, e 410 para o que foi removido
5. `exercicio_5` — forçar HTTPS com `RewriteCond %{HTTPS}` e enviar HSTS
6. `exercicio_6` — acervo de mídia em `/srv/midia` via `Alias`, listagem só em `/midia/fotos`
7. `exercicio_7` — um log por host virtual e descarte de requisições de estáticos
8. `exercicio_8` — endurecimento com CSP, `X-Frame-Options`, `Referrer-Policy` e cache por tipo de arquivo
9. `exercicio_9` — proxy reverso para `/busca` e `/api`, com `/estatico` servido localmente
10. `exercicio_10` — tipos MIME das fontes de linguagens como texto UTF-8 e download forçado de binários

## Preâmbulo de cada arquivo

Um trecho de configuração solto não pode ser testado isoladamente: `apache2 -t` lê o arquivo como configuração completa do servidor e aborta se faltar um MPM, se um módulo não estiver carregado ou se o `DocumentRoot` não existir. Por isso cada arquivo começa com um preâmbulo delimitado por comentários, que contém `ServerRoot`, um `Listen` em porta alta (8081 a 8100, para não colidir com a instalação do sistema), os `LoadModule` dos módulos usados, `ServerName` e um `ErrorLog` global. Fora do preâmbulo, o arquivo é a configuração que interessa ao tópico.

Os caminhos de módulo seguem o padrão Debian/Ubuntu (`/usr/lib/apache2/modules/`). Em uma instalação compilada a partir do código-fonte, troque-os pelos caminhos correspondentes ou compile os módulos estaticamente e apague essas linhas.

## Como validar

```sh
sudo apt-get install -y apache2        # 2.4.58 no Ubuntu 24.04
sudo mkdir -p /var/www/museu/{docs,downloads,restrito,legado} \
              /var/www/linguagens /var/www/arquivo /srv/midia/fotos
sudo mkdir -p /etc/ssl/museu
sudo openssl req -x509 -newkey rsa:2048 -nodes -days 365 -subj "/CN=museu.test" \
     -keyout /etc/ssl/museu/museu.key -out /etc/ssl/museu/museu.crt

apache2 -t -f /caminho/absoluto/exemplo_1.conf
```

O caminho precisa ser absoluto: com `-f` relativo, o Apache procura o arquivo a partir do `ServerRoot`. O teste apenas analisa a configuração; nenhum processo é iniciado e nenhuma porta é ocupada.

## Escopo e limitações

- **Validação de sintaxe, não de comportamento.** `apache2 -t` verifica diretivas, contextos, módulos e caminhos de log, mas não executa requisições. Que `RewriteRule`, `ProxyPass` ou `Header` produzam o efeito descrito depende do servidor em execução e do conteúdo dos diretórios.
- **Os diretórios e o certificado precisam existir** para o teste passar, porque o Apache checa `DocumentRoot` e o par certificado/chave na fase de verificação. Os caminhos usados são de exemplo (`/var/www/museu`, `/srv/midia`, `/etc/ssl/museu`).
- **`SSLCertificateFile`/`SSLCertificateKeyFile`** apontam para um certificado autoassinado. Em produção, use um certificado emitido por uma autoridade certificadora.
- **`Require all granted`** é a autorização do Apache 2.4. Em 2.2, o equivalente era `Order allow,deny` / `Allow from all`, incompatível com estes arquivos.
- **Sem CGI, sem PHP e sem autenticação**: nenhum arquivo depende de módulos que exigem processos externos, para que o conjunto permaneça verificável apenas com o servidor instalado.
- **Não há `.htaccess`** nos exemplos; `AllowOverride` aparece justamente para mostrar onde ele seria permitido.

## Validação executada

Os 40 arquivos foram verificados com `apache2 -t -f <caminho absoluto>`: 40 de 40 retornaram `Syntax OK` e código de saída 0. Um teste negativo, com `Require` grafado `Requir` em uma cópia, retornou `AH00526: Syntax error ... Invalid command 'Requir'` e código 1, confirmando que o verificador detecta erros reais. Os comandos e as saídas estão em `RELATORIO.md`.

## Referências

- Documentação oficial do Apache HTTP Server 2.4: <https://httpd.apache.org/docs/2.4/>
- Diretivas do núcleo (`DocumentRoot`, `ServerName`, `<Directory>`, `Options`, `AllowOverride`): <https://httpd.apache.org/docs/2.4/mod/core.html>
- `mod_alias` (`Alias`, `Redirect`, `RedirectMatch`): <https://httpd.apache.org/docs/2.4/mod/mod_alias.html>
- `mod_rewrite` (`RewriteEngine`, `RewriteCond`, `RewriteRule`): <https://httpd.apache.org/docs/2.4/mod/mod_rewrite.html>
- `mod_proxy` (`ProxyPass`, `ProxyPassReverse`, exclusão com `!`): <https://httpd.apache.org/docs/2.4/mod/mod_proxy.html>
- `mod_headers` (`Header`): <https://httpd.apache.org/docs/2.4/mod/mod_headers.html>
- `mod_ssl` (`SSLEngine`, `SSLCertificateFile`, `SSLProtocol`): <https://httpd.apache.org/docs/2.4/mod/mod_ssl.html>
- `mod_authz_core` (`Require`): <https://httpd.apache.org/docs/2.4/mod/mod_authz_core.html>
- `mod_mime` (`AddType`, `AddCharset`, `AddDefaultCharset`): <https://httpd.apache.org/docs/2.4/mod/mod_mime.html>
- Hospedagem virtual baseada em nome: <https://httpd.apache.org/docs/2.4/vhosts/name-based.html>
- Como as seções `<Directory>`, `<Location>` e `<Files>` se combinam: <https://httpd.apache.org/docs/2.4/sections.html>

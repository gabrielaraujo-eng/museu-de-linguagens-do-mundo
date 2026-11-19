# Museu de Linguagens do Mundo

Museu digital e interativo sobre a história e a diversidade das linguagens de programação. O projeto reúne um acervo navegável com **520 linguagens**, seus anos de referência, exemplos de código e exercícios introdutórios.

A experiência funciona diretamente no navegador, com uma interface inspirada em um museu futurista e foco em exploração e aprendizagem.

## Funcionalidades

- Catálogo com 520 linguagens organizadas em ordem alfabética.
- Busca instantânea por nome da linguagem.
- Cards com ícone, ano de referência, quantidade de exemplos e exercícios.
- Modal de detalhes para cada linguagem.
- Link direto para os arquivos reais de exemplos e exercícios no GitHub.
- Quantidade de exemplos e exercícios informada para cada linguagem do acervo.
- Fundo animado com Canvas API e layout responsivo para diferentes tamanhos de tela.
- Metadados para SEO, compartilhamento em redes sociais e indexação.

## Conteúdo do acervo

Cada linguagem possui uma pasta própria em [`linguagens/`](./linguagens), com arquivos de exemplos e exercícios em extensões relacionadas à linguagem. O inventário auxiliar está disponível em [`LISTA_ALFABETICA.md`](./LISTA_ALFABETICA.md).

A página principal apresenta os dados do catálogo e permite abrir o acervo correspondente no GitHub. O conteúdo é estático e não depende de banco de dados ou servidor de aplicação.

## Tecnologias

- HTML5
- CSS3
- JavaScript Vanilla
- Canvas API
- Google Fonts — Orbitron e Roboto
- Font Awesome 6.4.0 via CDN
- Highlight.js 11.9.0 via CDN
- GitHub Pages para publicação

## Executar localmente

O projeto não exige instalação de dependências. Clone o repositório e sirva os arquivos estáticos com um servidor local:

```bash
git clone https://github.com/gabrielaraujo-eng/museu-de-linguagens-do-mundo.git
cd museu-de-linguagens-do-mundo
python3 -m http.server 8000
```

Depois, acesse <http://localhost:8000> no navegador.

Também é possível usar qualquer servidor HTTP estático de sua preferência. Abrir o arquivo `index.html` diretamente pode limitar alguns recursos do navegador; por isso, recomenda-se usar um servidor local.

## Estrutura do projeto

```text
.
├── index.html              # Interface, estilos, dados do catálogo e lógica da aplicação
├── linguagens/             # Exemplos e exercícios organizados por linguagem
├── LISTA_ALFABETICA.md     # Inventário auxiliar em ordem alfabética
├── og-share.png            # Imagem de compartilhamento
├── robots.txt               # Diretrizes para rastreadores
├── sitemap.xml              # Mapa do site
└── .github/workflows/       # Automação de publicação no GitHub Pages
```

## GitHub Pages

O workflow em [`.github/workflows/pages.yml`](./.github/workflows/pages.yml) publica a raiz do projeto por meio do GitHub Actions.

A versão publicada está disponível em:

<https://gabrielaraujo-eng.github.io/museu-de-linguagens-do-mundo/>

## Como contribuir

Contribuições são bem-vindas. Para sugerir uma nova linguagem, corrigir um exemplo ou melhorar a documentação:

1. Crie um fork do repositório.
2. Faça suas alterações em uma branch específica.
3. Confira se os links, nomes de pastas e extensões estão corretos.
4. Abra um pull request descrevendo o que foi alterado.

Ao adicionar uma linguagem ao acervo, mantenha também o inventário de [`LISTA_ALFABETICA.md`](./LISTA_ALFABETICA.md) atualizado e preserve a organização dos arquivos existentes.

## Créditos

Idealizado e desenvolvido por **Gabriel Lúcio de Araújo**.

- GitHub: [@gabrielaraujo-eng](https://github.com/gabrielaraujo-eng)
- Repositório: [museu-de-linguagens-do-mundo](https://github.com/gabrielaraujo-eng/museu-de-linguagens-do-mundo)

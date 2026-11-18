# Museu de Linguagens do Mundo

Museu digital e interativo sobre a história e a diversidade das linguagens de programação. A experiência combina navegação por categorias, busca, favoritos, exemplos de código e exercícios.

## Destaques

- Acervo organizado por categorias e ordem alfabética.
- Busca e filtros em tempo real.
- Favoritos persistidos no navegador.
- Destaque de sintaxe e cópia rápida de exemplos.
- Linguagem aleatória e painel de estatísticas.
- Interface responsiva com estética de museu futurista.

## Tecnologias

HTML5, CSS3, JavaScript Vanilla, Canvas API, LocalStorage, Google Fonts, Font Awesome e Highlight.js via CDN.

## Executar localmente

```bash
git clone https://github.com/gabrielaraujo-eng/museu-de-linguagens-do-mundo.git
cd museu-de-linguagens-do-mundo
python3 -m http.server 8000
```

Acesse <http://localhost:8000> no navegador. A lista de apoio está em [`LISTA_ALFABETICA.md`](./LISTA_ALFABETICA.md).

## GitHub Pages

O workflow em `.github/workflows/pages.yml` já está configurado para publicar a raiz do projeto. Para ativar a publicação pela primeira vez, abra **Settings → Pages** no repositório e selecione **GitHub Actions** como fonte.

URL esperada: <https://gabrielaraujo-eng.github.io/museu-de-linguagens-do-mundo/>

## Créditos

Idealizado e desenvolvido por Gabriel Lúcio de Araújo.

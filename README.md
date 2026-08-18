### The code of [Zhao's Lab website](https://weisongzhao.github.io/) (second generation)

The bilingual site uses standalone HTML and Bootstrap 4. Every English page in the
project root and every Chinese page under `zh/` can be opened directly in a browser
without Jekyll, a local server, or another build tool. English URLs remain unchanged.

Local visual assets are organized by purpose under `img/`: `site`, `home`, `team`,
`projects`, `publications`, `gallery`, and `news`.

After editing English content or the translations in `tools/generate_chinese_site.rb`,
run `ruby tools/generate_chinese_site.rb` to refresh the Chinese static pages and all
paired language links.

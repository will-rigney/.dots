# nvim config

Uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for package management.
Normally installed via .dots alias, see .dots readme for more info.

## dependencies

todo: add information on how to install all of these things

### language servers

- Lua Language Server
- Rust Analyzer
- Bash Language Server
- clangd
- todo: think about mason to make life easier

### telescope

ripgrep
fd

(install through cargo)

## todo

- [*] figure out completion properly - mostly done with cmp plugin
- [*] autopairs
- [ ] filetypes: e.g. correct tabstop shift size, 
- [ ] editor_config support
- [ ] better keymap for selecting completion from popup, scrolling hover
  - mostly done but couple more interesting things to try
- [ ] q to quit instead of record macro in hover + help window
- [ ] stylua working for config files, autoformat more generally
- [ ] treesitter go to definition, etc when no lsp
- [ ] markdown, txt, data files should have better wrapping behaviour
- [ ] delete trailing whitespace on save / format on save
- [ ] don't auto insert comment string when entering new line from comment
- [ ] git integration + bindings
- [ ] more debug configs, rebuild current project

- [*] have bindings for vimgrep (n.b. this is done using telescope), 
- [*] change zellij keybinds to not have resize or pane options
  - ctrl-t for tabs still not optimal

### stretch

- [ ] org mode?

many more todos inline in files, do a grep and finish them all



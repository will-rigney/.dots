# nvim config

Uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for package management.
Normally installed via .dots alias, see .dots readme for more info.

todo: update to reflect using mostly dotsh alias now, with potential official cross platform support coming soon.

## features

### deranged rambling

- terminal filetype for setting local options
- ideal open behaviour / function to open windows:
  - if no split, open in a horizontal split
  - if already split, open on right side
- ideal close behaviour / function to close windows:
  - always delete buffer with window cycling to previous buffer and staying open
  - never close split pane unless deliberately

- open man pages in terminal window but special one where vim leader shortcuts work without escaping man terminal first
  - actually a few commands could work like this, anything not requiring spacebar text input

## dependencies

todo: add information on how to install all of these things

### language servers

no auto-installing, fail quietly if unable to load lsp for given filetype.
install through system repository wherever possible, especially:

- lldb-dap
- clangd

- install through rustup component add:
  - Rust Analyzer

- install through go:
  - delve
  - gofmt

- install through pip:
  - pyright
  - some python debug i forget

- install some other sinister way:
  - Lua Language Server
  - Bash Language Server
  - vscode language servers extracted
  `npm i -g vscode-langservers-extracted`

todo: think about mason to make life easier... but auto-installing random binaries seems like not my text editors job with only one or two exceptions.

n.b. tried mason, seems too magic better to manually install & quietly fail if not there

### telescope

couple dependencies specific to ripgrep (not including telescope-native-fzf which is compiled by the plugin).

these can be installed using cargo:

- ripgrep
- fd

## todo

many more todos littered in files, please grep at your pleasure

### in progress

- [ ] filetypes: e.g. correct tabstop shift size, 
- [ ] markdown, txt, data files should have better wrapping behaviour
  - ftplugin? done for markdown others not so much

### todo list

- [ ] man page opening in terminal still better than in buffer due to colours
- [ ] completion always show hover documentation
- [ ] more obvious compile commands
- [ ] more debug configs, rebuild current project
- [ ] editor_config support
- [ ] q to quit instead of record macro in hover + help window
- [ ] crazy idea of only ever having 2x vertical split
- [ ] fix tab completion conflict entering tab without typing
  - fixed??
- [ ] snippet integration esp. for lsp
  - done also i think?? haven't added any snippets
- [ ] go to definition doesn't really work, goes to declaration
- [ ] format on save (do we want automatically?)
- [ ] treesitter go to definition, etc when no lsp

#### also

- [ ] hydra mode?
- [ ] org mode? roam?

### done

- [x] never have text completions
- [x] better keymap for selecting completion from popup, scrolling hover (mostly done)
- [x] don't auto insert comment string when entering new line from comment
- [x] shortcut to open tig in terminal, set editor to parent nvim instance
- [x] stylua working for config files, autoformat more generally
- [x] autopairs - jury still out
- [x] have bindings for vimgrep (n.b. this is done using telescope), 
- [x] figure out completion properly - mostly done with cmp plugin
- [x] git integration + bindings


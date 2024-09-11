# nvim config

Uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for package management.
Normally installed via .dots alias, see .dots readme for more info.

todo: update to reflect using mostly dotsh alias now, with potential official cross platform support coming soon.

## features

- terminal filetype for setting buffer local options automatically
  - todo: not triggering for e.g. htop?

### theory on windows

- ideal open behaviour / function to open windows:
  - if no split, open in a horizontal split
  - if already split, open on right side
- ideal close behaviour / function to close windows:
  - always delete buffer with window cycling to previous buffer and staying open
  - never close split pane unless deliberately

### idea about nesting terminal commands in windows

- open man pages in terminal window but special one where vim leader shortcuts work without escaping man terminal first
  - actually a few commands could work like this, anything not requiring spacebar text input

## dependencies

todo: add & confirm information on how to install all of these things, at least make sure covers everything to be installed.

### language servers

no auto-installing, fail quietly if unable to load lsp for given filetype.
install through system repository wherever possible, especially:

should avoid in future:
`alias luamake="/home/will/dev/lua-language-server/3rd/luamake/luamake"`
being added to .bashrc

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

todo: think about mason... but auto-installing random binaries seems like not my text editors job with only one or two exceptions.

maybe some tooling would make sense for nvim to be in charge of installing for its own use.

n.b. tried mason, seems too magic better to manually install & quietly fail if not there

### telescope

couple dependencies specific to telescope (not including telescope-native-fzf which is compiled by the plugin).

these can be installed using cargo:

- ripgrep
- fd

## todo

many more todos littered in files, please grep at your pleasure

### in progress

- [ ] filetypes: e.g. correct tabstop shift size, 
- [ ] markdown, txt, data files should have better wrapping behaviour
  - ftplugin? done for markdown others not so much
- [ ] fix tab completion conflict entering tab without typing
  - fixed??
- [ ] snippet integration esp. for lsp
  - done also i think?? haven't added any snippets

### todo list

- [ ] pin working versions of all plugins
- [ ] editor_config support
- [ ] telescope.builtin open man page in terminal buffer
    - man page opening in terminal still better than in buffer due to colours
- [ ] completion always show hover documentation
- [ ] more obvious compile commands, potentially just?
  - [ ] more obvious debug configs, rebuild current project
- [ ] q to quit instead of record macro in hover + help window
  - think it is in help? slightly inconsistent with e.g. man
- [ ] crazy idea of only ever having 2x vertical split
- [ ] treesitter go to definition, etc when no lsp
  - [ ] go to definition doesn't really work, goes to declaration

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

### won't do

- [ ] format on save (do we want automatically?)

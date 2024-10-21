#############
## .bashrc ##
#############

# sourced when running a non-login shell (subshell)

# todo: maybe move to asdf or something for node, lua, python etc
# would prefer asdf to mason for nvim tools

# if not running interactively, don't do anything
# this is to stop aliases affecting scripts
# [[ $- != *i* ]] && return
# i dont think this has a point, bashrc always non-interactive

# set window title dynamically (why so serious)
# case ${TERM} in
#  alacritty)
# 	PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
# 	;;
# esac

# source profile
source "$HOME"/.profile

## alias

# fancy cursed ls
alias ls='exa -Fl --no-permissions --no-user'
alias la='exa -Flha'

# use `dots` to manage dots with git
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME';
# open dots shell add git env vars to session
alias dotsh='GIT_DIR=$HOME/.dots GIT_WORK_TREE=$HOME /usr/bin/bash'
# this is the preferred way to operate on config

# todo: produce some crossplatform equivalents

## path

# add $HOME/.local/bin to path
# todo: currently has pyright (not sure how) & nodeenv, maybe lua ls should be there too
# don't reallyl like this .local/bin idea
export PATH=$HOME/.local/bin:$PATH

# go path
export GOPATH="$HOME/dev/go"
export PATH="$HOME/dev/go/bin:$PATH"

# lua ls
# todo: this might just need to be in neovim environment
export PATH="$HOME/dev/lua-language-server/bin:$PATH"

# marksman ls
export PATH="$HOME/dev/marksman:$PATH"

# kotlin language server (getting shambolic)
export PATH="$HOME/dev/kotlin-language-server/server/build/install/server/bin:$PATH"

# source cargo env (path)
. "$HOME/.cargo/env"

# crystalline ls currently using a hardcoded value for binary location in neovim 
# and not added to path, why not these others? 

# needed for clang as default c compiler
alias cc='clang'

## man

# fix bat man formatting issues
export MANROFFOPT="-c"
# use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p' --colour"

## prompt

# init starship prompt
eval "$(starship init bash)";

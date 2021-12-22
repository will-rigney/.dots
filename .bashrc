# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# using starship instead
PS1='[\u@\h \W]\$ '

# todo: the ps2?

. "$HOME/.cargo/env"

# pnpm exports
export PNPM_HOME="/home/will/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# set title dynamically
case ${TERM} in
 alacritty)
	PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
	;;
esac

shopt -s expand_aliases

# alias
alias ls='ls --color=auto'
alias v='nvim'
alias la='ls -la'

# alias for "dots" managing dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# starship prompt
eval "$(starship init bash)"

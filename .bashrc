# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1 (use starship instead anyway)
PS1='[\u@\h \W]\$ '

. "$HOME/.cargo/env"

# set window title dynamically
case ${TERM} in
 alacritty)
	PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
	;;
esac

# todo: should aliases be here or .profile
# should move to zsh
shopt -s expand_aliases

# alias
# todo: more & better
alias ls='ls --color=auto'
alias v='nvim'
alias la='ls -lsa'

# todo: name
change-wal () {
	wal --backend schemer2 -i $1 --saturate 0.4 -b "#282c34"
}

# alias for "dots" managing dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# sway launcher desktop
alias swaymsg-launcher-desktop='swaymsg exec "$($HOME/Development/sway-launcher-desktop/sway-launcher-desktop.sh)"'

# starship prompt
eval "$(starship init bash)"

# pywal terminal colourscheme
(cat ~/.cache/wal/sequences &)

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
shopt -s expand_aliases

## alias

# fancy ls
alias ls='exa -Fl --no-permissions --no-user'
alias la='exa -Flha'

# use wal to update wallpaper * terminal colours
change-wal () {
	wp=$1;
	backend=${2:-1};
	if [ 2 = $backend ];
	then
		backend="schemer2";
	else
		backend="pywal"
	fi
	echo "Using backend: $backend";
	wal --backend $backend -i $wp --saturate 0.5 -b "#282c34";
}

# alias for "dots" managing dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME';

# rust ugdb
alias rugdb='ugdb --gdb rust-gdb --nh';

# starship prompt
eval "$(starship init bash)";

# pywal terminal colourscheme
(cat ~/.cache/wal/sequences &)

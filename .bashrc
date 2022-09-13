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

# i think maybe alias should be in profile
# and less wack / more careful

# fancy ls
# todo: include extra args, override etc obviously duh
alias ls='exa -Fl --no-permissions --no-user'
alias la='exa -Flha'

# zrepl
# source "$HOME/.zrepl_completions"

# function
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

# alias for "dots" managing dots with git
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME';

# rust ugdb alias
alias rugdb='ugdb --gdb rust-gdb --nh';

# pywal terminal colourscheme
# (cat ~/.cache/wal/sequences &)

# nvm - should be in .profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# init starship prompt
eval "$(starship init bash)";

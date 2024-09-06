# .bashrc

# if not running interactively, don't do anything
# this is to stop aliases affecting bash scripts
[[ $- != *i* ]] && return

# PS1 (use starship instead anyway)
PS1='[\u@\h \W]\$ '

# set window title dynamically
case ${TERM} in
 alacritty)
	PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
	;;
esac

# todo: should aliases be here or .profile
shopt -s expand_aliases

## alias

# fancy ls deeply cursed but i like it
alias ls='exa -Fl --no-permissions --no-user'
alias la='exa -Flha'

# use `dots` to manage dots with git
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME';
# use tig to manage dots
alias dtig='GIT_DIR=$HOME/.dots GIT_WORK_TREE=$HOME /usr/bin/tig'

# rust ugdb alias
alias rugdb='ugdb --gdb rust-gdb --nh';

# todo: maybe move to asdf or something for node, lua, python etc

# init starship prompt
eval "$(starship init bash)";

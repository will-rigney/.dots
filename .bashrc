##################
## bhad .bashrc ##
##################

# if not running interactively, don't do anything
# this is to stop aliases affecting scripts
[[ $- != *i* ]] && return

# PS1 (use starship instead anyway)
PS1='[\u@\h \W]\$ '

# set window title dynamically (why so serious)
case ${TERM} in
 alacritty)
	PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
	;;
esac

## alias

# fancy cursed ls
alias ls='exa -Fl --no-permissions --no-user'
alias la='exa -Flha'

# use `dots` to manage dots with git
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME';
# open dots shell add git env vars to session
alias dotsh='GIT_DIR=$HOME/.dots GIT_WORK_TREE=$HOME /usr/bin/bash'
# this is the preferred way to operate on config

# todo: maybe move to asdf or something for node, lua, python etc
# would prefer asdf to mason for nvim tools

## prompt

# init starship prompt
eval "$(starship init bash)";

###################
## .bash_profile ##
###################

# config sourced when running a login shell

# PS1 (use starship instead anyway)
PS1='[\u@\h \W]\$ '

# run sway on tty1 login
# todo: have been using gnome with a login manager but could return to sway
if [ "$(tty)" = "/dev/tty1" ]; then
	XDG_SESSION_TYPE=wayland exec sway
fi

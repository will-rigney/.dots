# .profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# environment
export TERMINAL="/usr/bin/alacritty"
export MOZ_ENABLE_WAYLAND=1

# cargo env
. "$HOME/.cargo/env"

# add $HOME/bin to path
export PATH=$HOME/bin:$PATH

# gtk theme
export GTK_THEME=Arc:dark

# run sway on tty1 login
if [ "$(tty)" = "/dev/tty1"]; then
	exec sway
fi

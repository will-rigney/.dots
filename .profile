# .profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# environment
export TERMINAL="/usr/bin/alacritty"
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME="qt5ct"

# cargo env
. "$HOME/.cargo/env"

# add $HOME/bin to path
export PATH=$HOME/.local/bin:$PATH

# pnpm exports
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# go path
export GOPATH="$HOME/dev/go"
export PATH="$HOME/dev/go/bin:$PATH"

# gtk theme
# export GTK_THEME=Arc:dark

# run sway on tty1 login
if [ "$(tty)" = "/dev/tty1" ]; then
	XDG_SESSION_TYPE=wayland exec sway
fi

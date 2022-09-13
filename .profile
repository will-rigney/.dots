# .profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# environment
export TERMINAL="/usr/bin/alacritty"
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export CALIBRE_USE_DARK_PALETTE=1

export $(dbus-launch)

# cargo env
. "$HOME/.cargo/env"

# add $HOME/bin to path
export PATH=$HOME/.local/bin:$PATH

# pnpm exports
# export PNPM_HOME="$HOME/.local/share/pnpm"
# export PATH="$PNPM_HOME:$PATH"

# go path
export GOPATH="$HOME/dev/go"
export PATH="$HOME/dev/go/bin:$PATH"

# add jdk17 to path (yes ik)
export PATH="$HOME/misc/jdk-17.0.1/bin:$PATH"

# applications in misc
# have to add each manually
# vscodium
export PATH="$HOME/misc/vscodium/bin:$PATH"

# needed for ghidra / awt
export _JAVA_AWT_WM_NONREPARENTING=1

# run sway on tty1 login
if [ "$(tty)" = "/dev/tty1" ]; then
	XDG_SESSION_TYPE=wayland exec sway
fi

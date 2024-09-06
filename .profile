# .profile

# environment
export TERMINAL="/usr/bin/alacritty"
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME="qt5ct"

# might not be needed with system d
export "$(dbus-launch)"

# use clang C compiler
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang"

# cargo env in path
. "$HOME/.cargo/env"

# add $HOME/.local/bin to path
# todo: currently has pyright & nodeenv, maybe lua ls should be there too
export PATH=$HOME/.local/bin:$PATH

# go path
export GOPATH="$HOME/dev/go"
export PATH="$HOME/dev/go/bin:$PATH"

# lua ls
# todo: this might just need to be in neovim environment
export PATH="$HOME/dev/lua-language-server/bin:$PATH"

# needed for ghidra / awt
export _JAVA_AWT_WM_NONREPARENTING=1

# run sway on tty1 login
if [ "$(tty)" = "/dev/tty1" ]; then
	XDG_SESSION_TYPE=wayland exec sway
fi
# set editor to neovim
export EDITOR="/usr/bin/nvim"

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
# todo: currently has pyright (not sure how) & nodeenv, maybe lua ls should be there too
# don't reallyl like this .local/bin idea
export PATH=$HOME/.local/bin:$PATH

# go path
export GOPATH="$HOME/dev/go"
export PATH="$HOME/dev/go/bin:$PATH"

# lua ls
# todo: this might just need to be in neovim environment
export PATH="$HOME/dev/lua-language-server/bin:$PATH"

# marksman ls
export PATH="$HOME/dev/marksman:$PATH"

# crystalline ls currently using a hardcoded value for binary location, why not these others?
# should it be in .profile or in nvim config

# needed for ghidra / awt
export _JAVA_AWT_WM_NONREPARENTING=1

# run sway on tty1 login
# todo: have been using gnome with a login manager but could return to sway
if [ "$(tty)" = "/dev/tty1" ]; then
	XDG_SESSION_TYPE=wayland exec sway
fi

# set editor to neovim
export EDITOR="/usr/bin/nvim"

# fix bat man formatting issues
export MANROFFOPT="-c"
# use bat as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p' --colour"
# todo: these sorts of renegade acts should be confined to bashrc


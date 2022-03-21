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

# scripts folder
export PATH=$HOME/scripts:$PATH

# go path
export GOPATH="$HOME/dev/go"
export PATH="$HOME/dev/go/bin:$PATH"

# add jdk17 to path (yes ik)
export PATH="$HOME/misc/jdk-17.0.1/bin:$PATH"

# julia
export PATH="$HOME/bin/julia-1.7.1/bin/:$PATH"

# ruby gems (ugh)
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# some stuff about using nvm for node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# some stuff about haxe
# export HAXE_STD_PATH="$HOME/dev/haxe/std"
# export HAXEPATH="$HOME/dev/haxe"
# export HAXELIB_PATH="$HOME/dev/haxe"
# export NEKOPATH="$HOME/dev/neko-2.3.0-linux64"
# export PATH=$HAXEPATH":"$NEKOPATH":"$PATH
# export DYLD_FALLBACK_LIBRARY_PATH="$HOME/dev/neko-2.3.0-linux64"

# allow us to use seatd instead of elogind
# export XDG_RUNTIME_DIR="/run/user/$UID"

# this stops sway just iterating over seat backends
export LIBSEAT_BACKEND=seatd

export WLR_NO_HARDWARE_CURSORS=1

# run sway on tty1 login
# potential also try dbus-run-session
if [ "$(tty)" = "/dev/tty1" ]; then
	# export XDG_CURRENT_DESKTOP=Unity
	export XDG_SESSION_TYPE=wayland
	# exec dbus-launch $(sway -d>$HOME/sway.log)
	exec /home/will/dev/dwl/dwl
fi

# this only works if sway has been started
export SWAYSOCK=$(find /run/user/$UID/ -name 'sway-ipc.*.sock' -print -quit)

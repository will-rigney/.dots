##############
## .profile ##
##############

# shell environment 

# might not be needed with systemd/fedora
# export "$(dbus-launch)"

## environment
# editor is neovim
export EDITOR="/usr/bin/nvim"
# terminal is alacritty
export TERMINAL="/usr/bin/alacritty"
# use qt theme decider for qt theme (i think)
export QT_QPA_PLATFORMTHEME="qt5ct"
# enable wayland in firefox, may be default now
export MOZ_ENABLE_WAYLAND=1

# use clang C compiler
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang"

# needed for ghidra / awt
# apparently... todo: you know
export _JAVA_AWT_WM_NONREPARENTING=1

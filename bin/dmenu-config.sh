#!/bin/bash

set -u

declare -a config_files=(
"bash $HOME/dotfiles/.bashrc"
"tmux $HOME/dotfiles/.tmux.conf"
"i3 $HOME/dotfiles/config/i3"
)

# Interesting du musst benuzt @ in array not *. Also, with arrays do musst
# put them in {name[indx]} to evaluate specific index.

# dmenu -i is only for case insensitive
choice=$(printf '%s\n' "${config_files[@]}" | dmenu -i -l 20 -p "Edit config")

# TODO: You can display only title, and then match it with path

if [ "$choice" ]; then
				path=$(echo $choice | awk '{print $NF}')
				termite -e "nvim $path"
fi


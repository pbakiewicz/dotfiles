# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

export PATH="$HOME/o/bin:$PATH"


alias vim=nvim
alias v=nvim
# zoxide chciałbym mieć pod "j" i nie chciałbym aby działało mi pod "cd"
eval "$(zoxide init bash --cmd j)"
alias cd="builtin cd"


# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

export PATH="$HOME/.local/bin:$PATH"


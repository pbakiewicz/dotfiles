set -U fish_greeting # No greeting

set -gx PATH /home/pawel/bin/notes/ $PATH
set -gx PATH /home/pawel/.local/bin/ $PATH
set -gx PATH /home/pawel/bin/ $PATH
set -gx PATH /home/pawel/bin/ssh/ $PATH
set -gx PATH /home/pawel/.npm-global/bin/ $PATH
# {{{ abbrs
abbr vim nvim
abbr n newsboat
abbr v "rg --files --no-messages  --hidden $HOME/dotfiles/ -g '!.git'| fzf | xargs -r nvim"
abbr vi "fzf | xargs -r nvim"
abbr va "rg --files --no-messages -g '!sys' -g '!proc' -g '!boot' / | fzf | xargs -r nvim"
abbr .. "cd .."
abbr ... "cd ../.."
# }}}


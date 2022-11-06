# PATH
export PATH="$PATH:$HOME/go/bin/"

### COMPLETIONS
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select # select on next TAB
_comp_options+=(globdots) # show hidden

### PYWAL COLORS
cat ~/.cache/wal/sequences

### SOURCING
source $HOME/.config/zsh/zsh-prompt
source $HOME/.config/zsh/zsh-aliases
source $HOME/.config/zsh/zsh-functions
source $HOME/.autojump/share/autojump/autojump.zsh # autojump
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#### START IN TMUX
# if [ -n "${DISPLAY}" ]; then
#  [ -z "${TMUX}" ] && { tmux -u } >/dev/null 2>&1 # stop printing commands 
# fi

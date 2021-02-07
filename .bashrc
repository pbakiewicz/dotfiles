#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -a'
alias grep='grep -i'
PS1='[\u@\h \W]\$ '

# Starting terminal in tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# History
export HISTTIMEFORMAT="%h %d %H:%M:%S"
export HISTCONTROL=erasedups
export HISTSIZE=100000
alias vim=nvim
alias n=newsboat

# Fzfing all files starting from ~ direcotry
alias v="rg --files --no-messages  --hidden $HOME/dotfiles/ -g '!.git'| fzf | xargs -r nvim"
alias vi="fzf | xargs -r nvim"
alias va="rg --files --no-messages -g '!sys' -g '!proc' -g '!boot' / | fzf | xargs -r nvim"

# Other bins like youtube-dl
export PATH="/home/pawel/bin/notes/:$PATH"
export PATH="/home/pawel/.local/bin/:$PATH"
export PATH="/home/pawel/bin/:$PATH"
export PATH="/home/pawel/bin/ssh/:$PATH"
# For npm global
export PATH="/home/pawel/.npm-global/bin:$PATH"

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash


# When selecting files with fzf, we show file content with syntax highlighting,
# or without highlighting if it's not a source file. If the file is a directory,
# we use tree to show the directory's contents.
# We only load the first 200 lines of the file which enables fast previews
# of large text files.
# Requires highlight and tree: pacman -S highlight tree
export FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||
cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!.git' "

# for ranger to open in newvim
export EDITOR=nvim
alias r=ranger

# autojump program
	[[ -s /home/pawel/.autojump/etc/profile.d/autojump.sh ]] && source /home/pawel/.autojump/etc/profile.d/autojump.sh


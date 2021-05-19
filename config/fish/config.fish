set -U fish_greeting # No greeting

set -gx PATH /home/pawel/.local/bin/ $PATH
set -gx PATH /home/pawel/bin/ $PATH
set -gx PATH /home/pawel/bin/ssh/ $PATH
set -gx PATH /home/pawel/.npm-global/bin/ $PATH
# {{{ abbrs
abbr v nvim
abbr n newsboat
abbr .. "cd .."
abbr ... "cd ../.."
# }}}
# sourcing autojump
. /home/pawel/.autojump/share/autojump/autojump.fish

fish_vi_key_bindings

# Making cd always displayin dir content
function cd
    if count $argv > /dev/null
	builtin cd "$argv"; and ls
    else
	builtin cd ~; and ls
    end
end
    

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
cat ~/.cache/wal/sequences &

#if status is-interactive
#and not set -q TMUX
#    exec tmux
#end


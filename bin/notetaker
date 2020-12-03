#!/bin/sh

noteFilename="$HOME/Dropbox/notes/note-$(date +%Y-%m-%d).md"
today="$(date +%Y-%m-%d)"

if [ -f $noteFilename ] && [ $(grep "$today" $noteFilename | wc -l) -eq 1 ]
then
nvim $noteFilename
else
nvim -c "norm ggO" \
				-c "norm O" \
				-c "norm O" \
				-c "norm i**$today**" \
				-c "norm 2o" \
 -c "startinsert" $noteFilename
fi


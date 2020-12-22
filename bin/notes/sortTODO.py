#!/usr/bin/python
import sys

file_path = sys.argv[1]

in_progress = []
done = []
with open(file_path) as todos:
    for line in todos.readlines():
        if '~' in line:
            done.append(line)
        else:
            in_progress.append(line)

with open(file_path, 'w') as todos:
    todos.writelines(in_progress)
    todos.writelines(done)

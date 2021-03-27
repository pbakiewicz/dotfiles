#!/usr/bin/python
import sys
from collections import defaultdict
file_path = sys.argv[1]

in_progress = []
done1 = defaultdict(list)
done = []
with open(file_path) as todos:
    for line in todos.readlines():
        if '~' in line:
            done.append(line)
            year, month, _ = line.split("|")[1].strip().split("-")
            done1[f"{year}-{month}"].append(line)
        else:
            in_progress.append(line)

sorted_path = file_path.replace(".", "-sorted.")

with open(sorted_path, 'w') as todos:
    todos.writelines(in_progress)
    for month, lines in done1.items():
        todos.write(f"\n**{month}**\n\n")
        todos.writelines(lines)

print(sorted_path)

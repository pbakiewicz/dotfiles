#!/bin/bash
set -u

# First delete old snaphosts
sudo lvremove /dev/vg0/for_*
today=$(date +%Y%m%d)
sudo lvcreate -L 50G -s -n for_root_${today} /dev/vg0/root
sudo lvcreate -L 80G -s -n for_home_${today} /dev/vg0/home

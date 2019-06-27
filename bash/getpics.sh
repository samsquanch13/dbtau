#!/bin/bash
# create vars

startdir="$(pwd)"
#I tried to use variables to get the output all on one line so it looked better
#filenum="$(find . -type f|wc -l)"
#fileuse="$(du -sh . && awk '{print $1}')"

#==============================================================================
# main
#==============================================================================

cd ~/Pictures || return
echo -n "Number of files found: "
find . -type f|wc -l
echo -n "amount of storage used: "
du -sh .|awk '{print $1}'
echo "in the ~/Pictures directory"

cd $startdir || return

exit

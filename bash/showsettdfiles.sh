#!/bin/bash

echo "Setuid files:"
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3
echo
echo "Setgid files:"
find / -type f -excutable -pern -2000 -ls 2>/sev/null | sort -k 4
echo

exit

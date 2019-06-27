#!/bin/bash

#F_VALUES=$(free -m)

# Main

touch free.txt
free -m > free.txt

# variables

TOTAL=$(awk -F" " 'NR==2,NR==2{ print $2 } ' free.txt)
USED=$(awk -F" " 'NR==2,NR==2{ print $3 } ' free.txt)
FREE=$(awk -F" " 'NR==2,NR==2{ print $4 } ' free.txt)
SHARE=$(awk -F" " 'NR==2,NR==2{ print $5 } ' free.txt)
CACHE=$(awk -F" " 'NR==2,NR==2{ print $6 } ' free.txt)
AVAIL=$(awk -F" " 'NR==2,NR==2{ print $7 } ' free.txt)
availFree_sum=$((AVAIL - FREE))
PercSHAREs=$((100 * $SHARE))
PercSHARE2=$((PercSHAREs / USED))
PercUSEDs=$((100 * USED))
PercUSED=$((PercUSEDs / TOTAL))
PercCACHEs=$((100 * CACHE))
PercCACHE=$((PercCACHEs / TOTAL))

#cat free.txt

#awk -F" " ' NR==2,NR==3{ printf "%-6s %5d %5d %5d %5d %5d %5d\n" , $2,$3,$4,$5,$6,$7 } ' free.txt

echo "All values in MB"
echo "=========================================="
awk -F" " '
BEGIN {
printf "%-5s %-5s\n" , "Total","Free" }
NR==2,NR==2{ printf "%-5d %-5d\n" , $2,$4 } ' free.txt
echo ""

awk -F" " '
BEGIN {
printf "%-5s %-6s\n" , "Used","Cached" }
NR==2,NR==2{ printf "%-5d %-5d\n" , $3,$6 } ' free.txt
echo ""

echo "Reserved"
echo $availFree_sum
echo ""

echo "Percentage of used RAM shared"
echo "$PercSHARE2 %"
echo ""

echo "Percent of Total RAM Used"
echo "$PercUSED %"
echo ""

echo "Percent of cached RAM"
echo "$PercCACHE %"
echo ""
# NR==2,NR==3{ printf "%5d %5d %5d %5d %5d %5d\n" , $2,$3,$4,$5,$6,$7 } ' free.txt

rm free.txt

exit

#!/bin/bash

# this script will roll dice with the user specifying number of dice and side
# count defaulting to a pair of six sided die.

# creating the variables

count="2"
sides="6"

USAGE="Usage: rollie.sh [-h] [-c n] [-s n] -- a program to generate a dice roll

options:
  -h display this help text

  -c count - change the number of dice rolled (default 2)

  -s sides - specify the number of sides on each die (default 6)"

# a while loop to pass arguments

while getopts ":hc:s:" option
do
  case "$option"
    in
    h) echo "$USAGE"
    exit;;
    c) count=${OPTARG};;
    s) sides=${OPTARG};;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
    echo "$USAGE" >&2
    exit 1;;
    \?) printf "ERROR: -%s\n" "OPTARG" >&2
    echo "$USAGE" >&2
    exit 1;;
  esac
done

# MAIN
echo "rolled $count item/s"
echo "with $sides sides"
echo ""

sum=0
while [ $count -gt 0 ]; do
    roll=$(( $RANDOM % $sides +1 ))
    sum=$(( $sum + $roll ))
    echo "Rolled $roll"
    count=$((count - 1))
done
echo "You rolled a total of $sum"

exit

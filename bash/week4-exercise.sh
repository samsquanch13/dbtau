#!/bin/bash

# variables ==========================================================

titles=("warchief" "supreme leader" "Commander" "Big dog" "Little dog" "pleb")
title_index=$((RANDOM % ${#titles[@]}))
title=${titles[$title_index]}

myname="DJ"
hostname=$(hostname)
weekday=$(date +%A)

#======================================================================
# main #
#======================================================================

# for users to choose their own title
#======================================================================
# echo "what is your title? "
# read title
#========================================

welcome_message="""
Welcome to planet $hostname, $title $myname!
today is $weekday
"""

echo "$welcome_message" | cowsay -f vader-koala

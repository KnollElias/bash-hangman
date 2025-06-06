#!/usr/bin/env bash
alphabet_block() {


  local -n ok_arr=$1 bad_arr=$2

  
  local l i=0
  for l in {a..z}; do
    if [[ " ${ok_arr[*]} " == *" $l "* ]]; then
      tput setaf 2
    elif [[ " ${bad_arr[*]} " == *" $l "* ]]; then
      tput setaf 1
    else
      tput setaf 7
    fi
    printf '%s ' "$l"
    tput sgr0
    ((++i % 9 == 0)) && echo
  done
  ((i % 9)) && echo
}

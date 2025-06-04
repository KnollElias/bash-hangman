#!/usr/bin/env bash
set -uo pipefail










initalising(){

echo ich bin ein dummes arxchloch 

local -n wrong=$1
local -n ok_word=$2
local -n bad_word=$3
local -n _secret=$4


display_startup "$_secret"
while : ; do
  if ! display_game_frame guessed_ok guessed_bad wrongstate secret; then 
  break 
  fi 


  # Eingabe
  while true; do
    read -rp "Rate einen Buchstaben (a-z): " -n1 ltr || {
      echo
      continue
    }
    echo
    [[ "$ltr" =~ [A-Za-z] ]] || {
      echo "Bitte gib einen Buchstaben ein."
      continue
    }
    ltr=${ltr,,}



    mistake_treatement guessed_ok guessed_bad $ltr wrongstate

    break 
    done 
    done 






}


mistake_treatement(){


local -n ok_guess=$1
local -n bad_guess=$2
local ltr=$3
local -n wrong_count=$4


[[ " ${ok_guess[*]} ${bad_guess[*]} " == *$ltr* ]] && echo schon geraten && return 

 if [[ "$secret" == *$ltr* ]]; then
    ok_guess+=("$ltr")
  else
    bad_guess+=("$ltr")
    ((wrong_count++))
  fi

  



}


 main(){



 dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$dir/drawings.sh"
source "$dir/wordlist.sh"
source "$dir/alphabet.sh"
source "$dir/display.sh"
source "$dir/endings.sh"

secret="$(choose_word)"
secret=${secret//$'\r'/}

guessed_ok=()
guessed_bad=()
wrongstate=0
 

initalising wrongstate guessed_ok guessed_bad secret


 }


 if [[ "${BASH_SOURCE[0]}"==$0 ]]; then 
 main
 fi  
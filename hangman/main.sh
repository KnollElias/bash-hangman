#!/usr/bin/env bash
set -uo pipefail

initalising() {

  if [[ "${BASH_SOURCE[0]}" != $0 ]]; then

    return
  fi

  local -n wrong=$1
  local -n ok_word=$2
  local -n bad_word=$3
  local -n _secret=$4

  display_startup "$_secret"
  while :; do
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

      process_guess guessed_ok guessed_bad $ltr wrongstate

      break
    done
  done

}

process_guess() {

  local -n ok_guess=$1
  local -n bad_guess=$2
  local ltr=$3
  local -n wrong_count=$4

  if [[ " ${ok_guess[*]} ${bad_guess[*]} " == *$ltr* ]]; then

    user_error="schon geraten"
    if [[ "${BASH_SOURCE[0]}" == $0 ]]; then
      echo $user_error
    fi
    sleep 2
    return
  fi

  if [[ "$secret" == *$ltr* ]]; then
    ok_guess+=("$ltr")
  else
    bad_guess+=("$ltr")
    ((wrong_count++))
  fi

}

main() {

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

else
  exit
fi

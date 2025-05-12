#!/usr/bin/env bash
set -uo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$dir/drawings.sh"
source "$dir/wordlist.sh"
source "$dir/alphabet.sh"
source "$dir/display.sh"

secret="$(choose_word)"
secret=${secret//$'\r'/}

guessed_ok=()       # richtige
guessed_bad=()      # falsche
wrongstate=0

startup "$secret"

while :; do
	game_frame guessed_ok guessed_bad "$wrongstate" "$secret"

  # Eingabe
  while true; do
    read -rp "Rate einen Buchstaben (a‑z): " -n1 ltr || { echo; continue; }
    echo
    [[ "$ltr" =~ [A-Za-z] ]] || { echo "Bitte Buchstabe."; continue; }
    ltr=${ltr,,}
    [[ " ${guessed_ok[*]} ${guessed_bad[*]} " == *" $ltr "* ]] \
        && { echo "Schon geraten."; continue; }
    break
  done

  if [[ "$secret" == *"$ltr"* ]]; then
      guessed_ok+=("$ltr")
  else
      guessed_bad+=("$ltr")
      ((wrongstate++))
  fi
done
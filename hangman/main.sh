#!/usr/bin/env bash
set -uo pipefail

mistake_countin() {

  local ltr=$1
  local secret=$2
  local -n ok_ref=$3
  local -n bad_ref=$4
  local -n wrong_ref=$5
 
 all="${ok_ref[*]} ${bad_ref[*]}"
      if [[ " $all " == *" $ltr "* ]]; then
      if [[ "${BASH_SOURCE[0]}" == $0 ]]; then 
        echo "schon geraten"
        fi 
        return 0
      fi
 
 if [[ "$secret" == *"$ltr"* ]]; then
    ok_ref+=("$ltr")
  else

    bad_ref+=("$ltr")
    ((wrong_ref++))
  fi
}

initialising() {

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

#echo "main wrongstate: '$wrongstate'"

  display_startup "$secret"

  while :; do
    display_game_frame "$wrongstate" "$secret" "guessed_ok" "guessed_bad"

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
      [[ " ${guessed_ok[@]} ${guessed_bad[@]} " == *" $ltr "* ]] &&
        {
          echo "Schon geraten."
          continue
        }
      break
    done

    mistake_countin "$ltr" "$secret" guessed_ok guessed_bad wrongstate

  done

  #mistake_countin "$ltr" "$secret" guessed_ok guessed_bad wrongstate

}

main() {

  initialising
  #mistake_countin $"ltr" "$secret" guessed_ok guessed_bad wrongstate
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main
fi

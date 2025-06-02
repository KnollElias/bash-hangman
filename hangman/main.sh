#!/usr/bin/env bash
set -uo pipefail

bad_guess=()
ok_guess=()

mistake_countin() {

  

  local ltr=$1
  local secret=$2
  declare -n ok_ref=$3
  declare -n bad_ref=$4
  declare -n wrong_ref=$5

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

  # local -n ok_ref=$1
  #local -n bad_ref=$2

  wrongstate=0

  display_startup "$secret"

  while :; do
    display_game_frame "$wrongstate" "$secret" ok_ref bad_ref

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
      
      break
    done

    mistake_countin "$ltr" "$secret" ok_ref bad_ref wrongstate

  done

}

main() {

  ref_ok=()
  ref_bad=()
  initialising ref_ok ref_bad
  mistake_countin $ltr $secret ref_ok ref_bad wrongstate
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main
fi

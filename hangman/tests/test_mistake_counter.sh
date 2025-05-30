#!/bin/bash

set -uoe pipefail

source "$(dirname "$0")/../main.sh"

test_mistake_countin() {

  local guessed_ok=()
  local guessed_bad=()
  local wrongstate=0
  local secret="Apfelsaft"

  # test 1

  mistake_countin "a" "$secret" guessed_ok guessed_bad wrongstate

  #echo $wrongstate

  [[ $wrongstate == 0 ]] && echo succes
  echo

  # test 2
  #echo hier tuts

  set +e

  mistake_countin "x" "$secret" guessed_ok guessed_bad wrongstate

  #echo $wrongstate

  [[ $wrongstate == 1 ]] || exit 1

  mistake_countin "x" "$secret" guessed_ok guessed_bad wrongstate

  # echo $wrongstate

  # [[ $wrongstate == 1 ]] || exit 1 #should remaim the same because x was already guessed.

}

test_mistake_countin

#mistake_countin "B" "Buchstabe"

#echo ${#guessed_bad[@]}

#for ()

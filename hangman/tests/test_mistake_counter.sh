#!/bin/bash

set -uoe pipefail

source "$(dirname "$0")/../main.sh"

test_mistake_countin() {

  local guessed_ok=()
  local guessed_bad=()
  local wrongstate=0
  local secret="Apfelsaft"

  # test 1
	echo "$wrongstate"
  mistake_countin "a" "$secret" guessed_ok guessed_bad wrongstate

  [[ $wrongstate == 0 ]]

  # test 2

  set +e

  mistake_countin "x" "$secret" ok_guess bad_guess wrongstate
  #echo $wrongstate

	echo "$wrongstate"
  [[ $wrongstate == 1 ]] || exit 1

  mistake_countin "x" "$secret" ok_guess bad_guess wrongstate

	echo "$wrongstate"
  [[ $wrongstate == 1 ]] || exit 1 #should remaim the same because x was already guessed.

}

test_mistake_countin

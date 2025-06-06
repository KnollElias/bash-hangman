#!/bin/bash

set -ueo pipefail

source "$(dirname "$0")/../main.sh"

test_mistake_countin() {

  local guessed_ok=()
  local guessed_bad=()
  local wrongstate=0
  ltr=a
  local secret="Apfelsaft"

  # test 1
  process_guess guessed_ok guessed_bad $ltr wrongstate
  [[ $wrongstate == 0 ]]

  # test 2
  set +e

  process_guess guessed_ok guessed_bad "x" wrongstate
  [[ $wrongstate == 1 ]] || exit 1

  process_guess guessed_ok guessed_bad "x" wrongstate
  [[ $wrongstate == 1 ]] || exit 1 # should remain the same because x was already guessed.
}

test_mistake_countin

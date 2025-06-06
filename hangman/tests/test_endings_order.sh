#!/bin/bash

set -ueo pipefail
BASE_DIR="$(dirname "$0")/.."

# Quelle die benötigten Dateien
source "$BASE_DIR/display.sh"
source "$BASE_DIR/endings.sh"
source "$BASE_DIR/drawings.sh"
source "$BASE_DIR/alphabet.sh"

test_endings_order() {
  ok_name=(a f)
  bad_name=(z)
  _wrong=3
  _secret="affe"

  ## test1: 3 mistakes
  endings_order $_wrong $_secret
<<<<<<< HEAD

  [[ $ending_output == "Geschafft, aber mit vielen Fehlern. Übung macht den Meister." ]]  || echo failed3
=======
  [[ $output == "Geschafft, aber mit vielen Fehlern. Übung macht den Meister." ]] || echo failed 
>>>>>>> 0a5115e6ac54fe1f197e3514b77fb4f2b76d2bb3

  ## test2: 0 mistakes
  _wrong=0
  _secret="affe"
  endings_order $_wrong $_secret
<<<<<<< HEAD

 

  [[ $ending_output == "Perfekt! 👍 Du hast das Wort ohne Fehler erraten." ]]  || echo failed1
 
=======
  [[ $output == "Perfekt! 👍 Du hast das Wort ohne Fehler erraten." ]] || echo failed 
>>>>>>> 0a5115e6ac54fe1f197e3514b77fb4f2b76d2bb3
}

test_endings_order

#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../alphabet.sh"

# with no guesses, should be 3 lines (9+9+8 letters)
lines=$(alphabet_block guessed_ok guessed_bad | wc -l)

echo $lines

#echo $lines

[[ "$lines" -eq 3 ]]

# with some guesses, still same line count
guessed_ok=(a m z)
guessed_bad=(x y)
lines=$(alphabet_block guessed_ok guessed_bad | wc -l)
[[ "$lines" -eq 3 ]]

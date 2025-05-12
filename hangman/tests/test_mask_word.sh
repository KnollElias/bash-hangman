#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../drawings.sh"

# mask_word uses global secret & guessed_ok
secret="hallo"
guessed_ok=(h l)
out=$(mask_word)
# h a l l o -> h _ l l _
[[ "$out" == "h _ l l _ " ]]

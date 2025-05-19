#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../display.sh"

# display_startup should print the welcome + length
out=$(display_startup "foobar" 2>&1)
[[ "$out" == *"Willkommen zu Hängmännli!"* ]]
[[ "$out" == *"Das Wort hat 6 Buchstaben."* ]]

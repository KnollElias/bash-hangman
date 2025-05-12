#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../display.sh"

# startup should print the welcome + length
out=$(startup "foobar" 2>&1)
[[ "$out" == *"Willkommen zu Hängmännli!"* ]]
[[ "$out" == *"Das Wort hat 6 Buchstaben."* ]]

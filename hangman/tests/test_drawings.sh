#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../drawings.sh"

# 1) Grundformen vorhanden
[[ "$(gallows)"  == *"__________"* ]]
[[ "$(wrong1)"   == *"|        O"* ]]
[[ "$(wrong4)"   == *"/|\ "* ]]
[[ "$(wrong6)"   == *"/ \ "* ]]

# 2) display() liefert korrekte Platzhalter / Buchstaben
secret="keks"
guessed=(k e)
out="$(display)"
[[ "$out" == "k e k _ " ]]

#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../wordlist.sh"

# 1) Datei existiert und hat Inhalt
init_wordfile
[[ -s "$(dirname "$0")/../wordlist_de.txt" ]]

# 2) choose_word liefert Kleinbuchstaben ohne Leerzeichen
for i in {1..5}; do
  w=$(choose_word)
  [[ "$w" =~ ^[a-z]+$ ]] || exit 1
done

# 3) ausgeliefertes Wort steht wirklich in der Datei
w=$(choose_word)
grep -qxF "$w" "$(dirname "$0")/../wordlist_de.txt"

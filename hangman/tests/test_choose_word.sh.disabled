#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../wordlist.sh"

# init file and pick some words
init_wordfile
for i in {1..5}; do
  w=$(choose_word)
  # only lowercase a–z
  [[ "$w" =~ ^[a-z]+$ ]] || exit 1
  # must exist in wordlist_de.txt
  grep -qxF "$w" "$(dirname "$0")/../wordlist_de.txt"
done

#!/usr/bin/env bash
game_frame() {
  local ok_name=$1 bad_name=$2 _wrong=$3 _secret=$4

  clear
  case $_wrong in
    0) gallows ;; 1) wrong1 ;; 2) wrong2 ;;
    3) wrong3 ;; 4) wrong4 ;; 5) wrong5 ;;
    6)
      wrong6
      echo "Du bist verhangen – das Wort war: $_secret"
      exit
      ;;
  esac

  echo
  local mask
  mask=$(mask_word)
  echo "Wort: $mask"
  echo

  [[ "$mask" != *"_"* ]] && {
    echo "Du hast gewonnen!"
    exit
  }

  alphabet_block "$ok_name" "$bad_name"
  echo
}

startup() {
  local _secret=$1
  clear
  echo
  echo "Willkommen zu Hängemännchen!"
  echo "Das Wort hat ${#_secret} Buchstaben."
  echo
}

#!/usr/bin/env bash
game_frame() {                 # 4 Argumente: Namen, Fehler, Wort
  local ok_name=$1
  local bad_name=$2
  local _wrong=$3
  local _secret=$4

  clear
  case $_wrong in
    0) gallows ;; 1) wrong1 ;; 2) wrong2 ;;
    3) wrong3  ;; 4) wrong4 ;; 5) wrong5 ;;
    6) wrong6; echo "Du bist verhangen – das Wort war: $_secret"; exit ;;
  esac

  echo
  local mask
  mask=$(mask_word)               # nutzt Globals
  echo "Wort: $mask"
  echo

  [[ "$mask" != *"_"* ]] && { echo "Du hast gewonnen!"; exit; }

  alphabet_block "$ok_name" "$bad_name"   # << richtige Übergabe
  echo
}

startup() { … unverändert … }

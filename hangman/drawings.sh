#!/usr/bin/env bash

gallows() {
  cat << 'ART'
   __________     
   |        |     
   |              
   |              
   |              
___|______________
ART
}

wrong1() {
  cat << 'ART'
   __________     
   |        |     
   |        O     
   |              
   |              
___|______________
ART
}

wrong2() {
  cat << 'ART'
   __________     
   |        |     
   |        O     
   |        |     
   |              
___|______________
ART
}

wrong3() {
  cat << 'ART'
   __________     
   |        |     
   |        O     
   |        |\    
   |              
___|______________
ART
}

wrong4() {
  cat << 'ART'
   __________     
   |        |     
   |        O     
   |       /|\    
   |              
___|______________
ART
}

wrong5() {
  cat << 'ART'
   __________     
   |        |     
   |        O     
   |       /|\    
   |         \    
___|______________
ART
}

wrong6() {
  cat << 'ART'
   __________     
   |        |     
   |        O     
   |       /|\    
   |       / \    
___|______________
ART
}

display() {
  local out=""
  for ((i = 0; i < ${#secret}; i++)); do
    ch="${secret:i:1}"
    [[ " ${guessed[*]} " == *" $ch "* ]] && out+="$ch " || out+="_ "
  done
  echo "$out"
}

mask_word() {
  local out=""
  for ((i = 0; i < ${#secret}; i++)); do
    ch="${secret:i:1}"
    [[ " ${guessed_ok[*]} " == *" $ch "* ]] && out+="$ch " || out+="_ "
  done
  echo "$out"
}

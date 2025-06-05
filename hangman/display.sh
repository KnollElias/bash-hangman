#!/usr/bin/env 


display_game_frame() {





  local -n ok_name=$1
  local -n bad_name=$2
  local -n _wrong=$3
  local -n _secret=$4

  clear



  case $_wrong in
    0) gallows ;; 1) wrong1 ;; 2) wrong2 ;;
    3) wrong3 ;; 4) wrong4 ;; 5) wrong5 ;;
    6)wrong6
      echo "Du bist verhangen - das Wort war: $_secret"
      return 1 
      ;;
  esac
  





  echo
  #local ma sk
  mask=$(mask_word)
  echo "Wort: $mask"
  echo
 

  alphabet_block ok_name bad_name

  


  cleaned="${mask// /}"
  if [[ $_secret == $cleaned ]]; then 

  endings_order $_wrong $mask 
  return 1 # this is needed for the if-clause in the main module that checks if 
  # the loop should start again
  fi 

  echo

return 0 
   
  }



  



endings_order(){

local wrong=$1
local mask=$2



[[ "$mask" != *"_"* ]] && {
    case $_wrong in
      0) mistakes0 ;;
      1) mistakes1 ;;
      2) mistakes2 ;;
      3) mistakes3 ;;
      4) mistakes4 ;;
      5) mistakes5 ;;
      *)
        mistakes6
        echo "Du hast gewonnen!"
        ;;

    esac


if [[ "${BASH_SOURCE[0]}" == $0 ]]; then 

  echo $output
fi 

}
}



display_startup() {
  local _secret=$1
  clear
  echo
  echo "Willkommen zu Hangman!"
  echo "Das Wort hat ${#_secret} Buchstaben."
  echo
  sleep 3.3
}



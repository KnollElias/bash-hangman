#!/usr/bin/env 


display_game_frame() {
  local  _wrong=$1 _secret=$2

  echo $_wrong
  echo $_secret


  clear


  case $_wrong in
    0) gallows ;; 1) wrong1 ;; 2) wrong2 ;;
    3) wrong3 ;; 4) wrong4 ;; 5) wrong5 ;;
    6)
      wrong6
      echo "Du bist verhangen - das Wort war: $_secret"
      return
      ;;
  esac

  echo
  
  mask=$(mask_word $_secret)
  echo "Wort: $mask"
  echo

  endings_order $_wrong $_secret 
  #}

  alphabet_block "$ok_name" "$bad_name"
  echo
}


endings_order(){


_wrong=$1 _secret=$2


  [[ "$mask" != *"_"* ]] && {
    case $_wrong in
      0) mistakes0 ;;
      1) mistakes1 ;;
      2) mistakes2 ;;
      3)mistakes3 ;;
      4) mistakes4 ;;
      5) mistakes5 ;;
      *)
   #     mistakes6
        echo "Du hast gewonnen!"
        ;;

    
    esac

    echo $output


    return





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

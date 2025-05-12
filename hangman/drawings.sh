#!/usr/bin/env bash

gallows(){ cat <<'ART'
   __________     
   |        |     
   |              
   |              
   |              
___|______________
ART
}

wrong1(){ cat <<'ART'
   __________     
   |        |     
   |        O     
   |              
   |              
___|______________
ART
}

wrong2(){ cat <<'ART'
   __________     
   |        |     
   |        O     
   |        |     
   |              
___|______________
ART
}

wrong3(){ cat <<'ART'
   __________     
   |        |     
   |        O     
   |        |\    
   |              
___|______________
ART
}

wrong4(){ cat <<'ART'
   __________     
   |        |     
   |        O     
   |       /|\    
   |              
___|______________
ART
}

wrong5(){ cat <<'ART'
   __________     
   |        |     
   |        O     
   |       /|\    
   |         \    
___|______________
ART
}

wrong6(){ cat <<'ART'
   __________     
   |        |     
   |        O     
   |       /|\    
   |       / \    
___|______________
ART
}

# ------------------------------------------------------------------
# zeigt _ _ _  bzw. bereits erratene Buchstaben
# benötigt die globalen Variablen $secret und array $guessed
display(){
   local out=""
   for ((i=0;i<${#secret}; i++)); do
      ch="${secret:i:1}"
      [[ " ${guessed[*]} " == *" $ch "* ]] && out+="$ch " || out+="_ "
   done
   echo "$out"
}

mask_word() {                    # statt display()
   local out=""
   for ((i=0;i<${#secret}; i++)); do
      ch="${secret:i:1}"
      [[ " ${guessed_ok[*]} " == *" $ch "* ]] && out+="$ch " || out+="_ "
   done
   echo "$out"
}

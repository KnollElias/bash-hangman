#!/bin/bash 

set -ueo pipefail 

source ../main.sh 

ok_test=()
bad_test=(a)
ltr="a"
wrong_value=0 


mistake_treatement ok_test bad_test $ltr wrong_value 

if [[ ${#ok_test[@]} == 0 &&  ${#bad_test[@]} == 1 ]]; then  # testing if the array if the arrays
# are not manipulated. 
echo succes 
else 
echo kein succes 
echo ${bad_test[@]} 
echo ${ok_test[@]}
fi 


# testing if there is the correct user_error in case of trying a letter again. 

[[ $user_error == "schon geraten" ]] && echo succes 





#!/bin/bash 

set -ueo pipefail 

source ../main.sh 

ok_test=()
bad_test=(a)
ltr="a"
wrong_value=0



process_guess ok_test bad_test $ltr wrong_value 

if ! [[ ${#ok_test[@]} -eq 0 &&  ${#bad_test[@]} -eq 1 ]]; then  # testing if the array if the arrays
# are not manipulated.  
exit 1



fi 


# testing if there is the correct user_error in case of trying a letter again. 



[[ $user_error == "schon geraten" ]] || exit  # more safety





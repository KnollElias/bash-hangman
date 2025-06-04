#!/bin/bash 

set -ueo pipefail 

source ../main.sh 

ok_guess=()
bad_guess=(a)
ltr="a"
wrong_count=0 


mistake_treatement ok_guess bad_guess $ltr wrong_count


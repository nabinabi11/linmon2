#!/bin/bash

function check {
    if [[ ${args} -ne 1 ]] ; then
        echo "Try again: main.sh 1"
    	exit 1
    fi

    if [[ ${1} -lt 1 || ${1} -gt 3 ]]; then
        echo "Write from 1 to 3 only"
        exit 1
    fi

    if [[ $1 -eq 1 ]]; then
        log_clean
    elif [[ $1 -eq 2 ]]; then
        date_clean
    elif [[ $1 -eq 3 ]]; then
        name_clean
    fi
}

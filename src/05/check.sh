#!/bin/bash

function check {
    if [[ ${args} -ne 1 ]]
    then
	    echo "Only number from 1 to 4"
        exit 1
    fi

    if [[ ${1} -gt 4 || ${1} -lt 1 ]]; then
        echo "Incorrect"
        exit 1
    fi

    if [[ $1 -eq 1 ]]; then
        code
    elif [[ $1 -eq 2 ]]; then
        ip
    elif [[ $1 -eq 3 ]]; then
        err
    elif [[ $1 -eq 4 ]]; then
        ip_err
    fi
}
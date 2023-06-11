#!/bin/bash

function check {
    if [[ $args -ne 6 ]]
    then
        echo "Only 6 arguments"
        echo "Try again: main.sh /opt/test 4 az 5 az.az 3kb"
        exit 1
    fi

    last=$(echo "${1}" | tail -c 2)
    if [[ $last == "/" ]] || ! [[ -d $1 ]]
    then
        echo "Uncorrect path"
        exit 1
    fi

    reg='^[1-9][0-9]+?$'
    if ! [[ $2 =~ $reg ]]
    then
        echo "Only numbers for quantity folders"
        echo "Try again: main.sh /opt/test 4 az 5 az.az 3kb"
        exit 1
    fi

    reg='^[a-zA-Z]{1,7}$'
    if ! [[ $3 =~ $reg ]]
    then
        echo "Only letters from 1 to 7 symbols for folders name"
        echo "Try again: main.sh /opt/test 4 az 5 az.az 3kb"
        exit 1
    fi

    reg='^[1-9][0-9]+?$'
    if ! [[ $4 =~ $reg ]]
    then
        echo "Only numbers for quantity files"
        echo "Try again: main.sh /opt/test 4 az 5 az.az 3kb"
        exit 1
    fi

    reg='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'
    if ! [[ $5 =~ $reg ]]
    then
        echo "Only letters for file name"
        echo "Try again: main.sh /opt/test 4 az 5 az.az 3kb"
        exit 1
    fi

    filesize="${6%k*}"
    if [[ filesize -le 0 ]] || [[ filesize -gt 100 ]]
    then
        echo "Only numbers from 1 to 100 with 'kb' for size files"
        echo "Try again: main.sh /opt/test 4 az 5 az.az 3kb"
        exit 1
    fi
}

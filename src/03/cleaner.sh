#!/bin/bash

function log_clean {
    find_logs="$(dirname $(cat ../02/logs.txt | awk -F'  ' '{print $1}'))"
    reg='^\/'
    for i in $find_logs; do
        if [[ $i =~ $reg ]]; then
        rm -rf $i
        fi
    done
    echo "Cleaning is over"
}

function date_clean {
    echo "Example: YYYY-MM-DD HH:MM"
    read -p "Enter START date and time: " start

    reg='^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$'
    if [[ $start =~ $reg ]] ; then
        echo ""
    else
        echo "Error"
        exit 1
    fi

    echo "Example: YYYY-MM-DD HH:MM"
    read -p "Enter FINISH date and time: " finish

    if [[ $finish =~ $reg ]] ; then
        echo ""
    else
        echo "Error"
        exit 1
    fi

    find_date="$(find ../02 -newermt "$start" ! -newermt "$finish" -type d)"

    for i in $find_date; do
        if ! [[ $i == '../02' ]] ; then
            rm -rf $i
        fi
    done
    echo ""
    echo "Cleaning is over"
}

function name_clean {

    echo "Exaple: asda_DDMMYY"
    read -p "Enter name mask of file: " name

    find_mask="$(find ../02 -name "*$name")"

    for i in $find_mask; do
        if ! [[ $i == '../02' ]]; then
            rm -rf $i
        fi
    done
    echo ""
    echo "Cleaning is over"
}
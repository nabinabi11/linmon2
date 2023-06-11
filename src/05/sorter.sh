#!/bin/bash

function code {
    for (( i=1; i<6; i++ ))
    do
        sort -k 9 ../04/$i.log -o code_$i.log
        echo "$(pwd)"
    done
}

function ip {
    for (( i=1; i<6; i++ ))
    do
        awk '{print $1}' ../04/$i.log  | uniq > ip_$i.log
    done
}

function err {
    for (( i=1; i<6; i++ ))
    do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log > error_$i.log
    done
}

function ip_err {
    for (( i=1; i<6; i++ ))
    do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log | awk '{print $1}' | uniq > error_ip_$i.log
    done
}
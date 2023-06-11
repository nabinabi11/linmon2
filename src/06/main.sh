#!/bin/bash

if [ $# != 0 ] ; then
    echo "Error"
else
    goaccess ../04/*.log --log-format=COMBINED > index.html
fi

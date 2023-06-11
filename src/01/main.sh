#!/bin/bash

source ./check.sh
source ./create.sh

export args=${#}

check "$1" "$2" "$3" "$4" "$5" "$6"
cr_folders "$1" "$2" "$3" "$4" "$5" "$6"

#nyarlath


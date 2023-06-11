#!/bin/bash

source ./check.sh
source ./tra.sh

export args=${#}
export name_folders=${1}
export files_name=${2}
export size_files=${3}

check
start
trash

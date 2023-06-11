#!/bin/bash

function check {
    if [[ $args -ne 3 ]] ; then
        echo "Error arguments. Try again: ./main.sh az az.az 3Mb"
        exit 1
    fi

    reg='^[A-Za-z]+$'
    if ! [[ $name_folders =~ $reg ]]; then
        echo "Error folders name. Only latters"
        echo "Try again: ./main.sh az az.az 3Mb"
        exit 1
    else
        if [[ ${#name_folders} -gt 7 ]]; then
        echo "Error folders name. No more than 7 letters"
        echo "Try again: ./main.sh az az.az 3Mb"
        exit 1
        fi
    fi

    reg='^[A-Za-z]{1,7}[.][A-Za-z]{1,3}$'
    if ! [[ $files_name =~ $reg ]]; then
        echo "Error file name."
        echo "Try again: ./main.sh az az.az 3Mb"
        exit 1
    fi

    export before_dote=$(echo $files_name | awk -F. '{print $1}')
    export after_dote=$(echo $files_name | awk -F. '{print $2}')

    reg='^[0-9]+Mb$'
    if ! [[ $size_files =~ $reg ]]; then
        echo "Error size."
        echo "Try again: ./main.sh az az.az 3Mb"
        exit 1
    else
        # извлекаем число из третьего аргумента
        export s_files=$(echo $size_files | awk -F"Mb" '{print $1}')
        # проверяем, что число находится в диапазоне от 1 до 100
        if [[ ($s_files -gt 100) || ($s_files -lt 1) ]]; then
        echo "Error size. No more then 100Mb"
        echo "Try again: ./main.sh az az.az 3Mb"
        exit 1
        fi
    fi
}

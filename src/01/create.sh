#!/bin/bash

function cr_folders
{
        dir_name="$3"
        touch log.txt
        startname=$3

        for (( number=0; number < $2; number++ ))
        do
                if [[ ${#dir_name} -lt 4 ]]; then
                        startname=${dir_name::1}
                        startname+=$dir_name
                        dir_name=$startname
                fi
                dir_name+=${dir_name: -1}
                final_name=$dir_name
                final_name+="_"
                final_name+=$(date +"%d%m%y")
                mkdir $1/$final_name
                echo -e "$path"/"-------$(date +'%e.%m.%Y')" >> log.txt
                cr_files "$1/$final_name" "$4" "$5" "$6"
        done
}

function cr_files # $1 путь папки, $2 число файло, $3 имя файлов, $4 размер файлов
{
        path=$1
        file_name=${3%.*}
        type=${3##*.}
        startchar=$3
        size=${4:0:${#4}-2}

        for (( j=0; j < $2; j++ ))
        do
                if [[ ${#file_name} -lt 4 ]]; then
                        startchar=${file_name::1}
                        startchar+=$file_name
                        file_name=$startchar
                fi
                file_name+=${file_name: -1}
                final_filename=$file_name
                final_filename+="."
                final_filename+=$type
                touch $path/$final_filename
                fallocate -l ${size}K $path/$final_filename
                echo -e "$path"/"$final_filename ---- $(date +'%e.%m.%Y') ----- ${size}kb" >> log.txt
                freespace=$(df -h / -BM | grep '/' | awk -F"M" '{print $3}')
                if [[ ${freespace} -le 1024 ]]; then
                        echo "Space error"
                fi
        done
}


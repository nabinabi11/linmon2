#!/bin/bash

function start {
    START=$(date +'%s')
    START_TIME=$(date | awk '{print $5}')
    DATE="$(date +'%d%m%y')"
    DIRECTORY=$(pwd)
    reg='\/[s]?bin'
    startname=$name_folders
    startchar=$before_dote
    if [[ $DIRECTORY =~ $reg ]]; then
        echo "Error. Directory can't be /bin or /sbin"
        exit 1
    fi
    if [[ ${#name_folders} -lt 5 ]]; then
        for (( i=${#name_folders}; i<5; i++ )); do
                        startname=${name_folders::1}
                        startname+=$name_folders
                        name_folders=$startname
        done
    fi
    if [[ ${#before_dote} -lt 5 ]]; then
        for (( i=${#before_dote}; i<5; i++ )); do
            startchar=${before_dote::1}
            startchar+=$before_dote
            before_dote=$startchar
        done
    fi
}

function trash {
    name_folder_plus=$name_folders
    num_folders=100
    before_plus=$before_dote
    save_bd=$before_dote

    for (( i=1; i<=$num_folders; i++ )); do
        mkdir $DIRECTORY"/"$name_folders"_"$DATE
        num_files=$(( 1 + $RANDOM % 100))
        for (( j=1; j<=$num_files; j++ )); do
            fallocate -l $s_files"MB" $DIRECTORY"/"$name_folders"_"$DATE"/"$before_dote"_"$DATE"."$after_dote
            echo $DIRECTORY"/"$name_folders"_"$DATE"/"$before_dote"_"$DATE"."$after_dote"  "$(date)"  "$s_files"Mb" >> logs.txt
            before_plus=${before_dote::1}
            before_plus+=$before_dote
            before_dote=$before_plus

            space=$(df -h / -BM | grep '/' | awk -F"M" {'print $3'})
            if [[ $space -le 1024 ]]; then
                FINISH_TIME=$(date | awk '{print $5}')
                END=$(date +'%s')
                DIFF=$(( $END - $START ))
                echo "Start working - $START_TIME"
                echo "Stop working - $FINISH_TIME"
                echo "Time of job = $DIFF sec."
                echo "Start working - $START_TIME; Stop working - $FINISH_TIME; Time of job - $DIFF sec." >> logs.txt
                exit 1
            fi
        done
        # Сбрасываем имя файла до исходной длины
        before_dote=$save_bd
        # Увеличиваем имя папки на одну букву
        name_folder_plus=${name_folders::1}
        name_folder_plus+=$name_folders
        name_folders=$name_folder_plus
    done
}

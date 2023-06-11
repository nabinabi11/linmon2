#!/bin/bash

function log_cr {
    sec=$(shuf -i 10-60 -n1)
    rec=$(shuf -n1 -i 100-1000)
    for (( i=1; i<6; i++ )); do
        for (( j=0; j<rec; j++ )) ; do
            ip="$(shuf -n1 -i 1-199).$(shuf -n1 -i 1-255).$(shuf -n1 -i 1-255).$(shuf -n1 -i 1-255)"
            times="[$(date -d "$date + $sec seconds"  +'%d/%b/%Y:%H:%M:%S %z')]"
            name="- -"
            method="${methods[$(shuf -i 0-4 -n1)]}"
            htp="${http[$(shuf -i 0-2 -n1)]}"
            code="${answer_code[$(shuf -i 0-9 -n1)]} $(shuf -i 0-100000 -n1)"
            urrl="${url[$(shuf -i 0-3 -n1)]}"
            slash="\"-\""
            agen="${agents[$(shuf -i 0-8 -n1)]}"
            echo "$ip $name $times \"$method $urrl $htp\" $code $slash \"$agen\"" >> day$i.log
            ((sec+=$(shuf -i 10-60 -n1) ))
        done
        echo "Log day$i.log was created"
        date="$(date +%Y)-$(date +%m)-$(date +%d) 00:00:00 $(date +%z)"
        date="$(date -d "$date - $((6-$i)) days" +'%Y-%m-%d')"
    done
}
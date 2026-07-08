#!/bin/bash
read -p "enter year " year

decr=$(ls -ltr tSA*_$year*| cut -d _ -f 3|wc -l)
echo "decr var $decr"

if [[ ${#year} -gt 4 ]] ; then
    i=$(ls tSA*_$year*| cut -d _ -f 3|sort -u |head -$decr|tail -1)
    zip -m COMO.$i.zip *$i*
    exit 1
else
    echo "Good to go..."
        while [ $decr -gt 0 ]
        do

        i=$(ls tSA*_$year*| cut -d _ -f 3|sort |head -$decr|tail -1)
        dates=$(ls tSA*_$year*| cut -d _ -f 3|sort -u |wc -l)
        decr=$dates
        echo $i

        zip -m COMO.$i.zip *$i*
        decr=$((decr-1))
        done
        exit 0
fi
echo $i

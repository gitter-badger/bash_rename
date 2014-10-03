#!/bin/bash

IFS=$'\n'
cd $1
files=(`ls -1`)
ZEROST=5

for cnt in `seq 1 ${#files[@]}`; do
    if [ -f ${files[$cnt]} ]; then
        i=`expr $i + 1`
    fi
done

if [ $i -gt 0 ]; then
    i=`expr $i - 1`
fi

for cnt in `seq 0 $i`; do
    temp=$cnt
    digit=1
    zeString=""
    while [ $temp -gt 9 ]; do
        temp=`expr $temp / 10`
        digit=`expr $digit + 1`
    done
    zero=`expr $ZEROST - $digit`
    while [ $zero -gt 0 ]; do
        zeString="$zeString"0""
        zero=`expr $zero - 1`
    done
    if [ -f ${files[$cnt]} ]; then
        if [ ${files[$cnt]} != "${2}${zeString}${cnt}.jpg" ]; then
            mv ${files[$cnt]} "${2}${zeString}${cnt}.jpg"
        fi
    fi
    cnt=`expr $cnt + 1`
done

IFS=$' \t\n'

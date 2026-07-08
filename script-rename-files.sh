#!/bin/bash
read date1
read date2

find . -type f -name '*date1*' |while read FILE ; do newfile="$(echo ${FILE} |sed -e 's/\\date1/date2/')" ; mv "${FILE}" "${newfile}" ; done

#this can happen with both commands
#or
#find . -name '*date1*' |sed -r "p:s/date1/date2/" |xargs -n2 mv
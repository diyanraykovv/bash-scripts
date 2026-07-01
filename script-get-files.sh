#!/bin/bash

#delete files from previous execution of script
find . -type f -name 'L&D_1215_P_SOMETHING_SOMETHING_F_*' -exec rm -rf {} \; && find . -type d -exec rm -rf {} \; 2> /dev/null
#this works as well
#rm -rf ./2026070*

#I use these so the file generation can be more readable
dates=$(date +'%Y%m%d')
datehrs=$(date +'%Y%m%d%H%M%S')
for i in {1..9}
do
        #I do not use /{DELTA,FULL} here because brace expansion is interpreted differently in variables
        dirs=$(date +%Y%m)"0$i"/TABLE"$i"
        mkdir -p "$dirs"/{DELTA,FULL}
        #generates files
        touch "$dirs"/{DELTA,FULL}/L\&D_1215_P_SOMETHING"$i"_SOMETHING"$i"_F_"$dates"_"$datehrs".txt
        tree
        #needed for file generation since i use seconds to generate filenames
        sleep 1
done

#!/bin/bash
#below line deletes files from previous tries
find . -type f -name 'L&D_1215_P_SOMETHING_SOMETHING_F_*' -delete && find . -type d -delete

#dirs=$(date '+%Y%m')'0'$i/{'DELTA','FULL'}
#put this in pattern for easyer reading
dates=$(date +'%Y%m%d')
datehrs=$(date +'%Y%m%d%H%M%S')
for i in {1..9}
do        
        #this is a dir variable I did not put "$dirs"{DELTA,FULL} at the end because brace expansion does not work with variables 
        #also put it in the loop to increment "i" variable so directories can be different
        dirs=$(date +%Y%m)"0$i"/
        mkdir -p "$dirs"{DELTA,FULL}
        #creates every file
        touch "$dirs"{DELTA,FULL}/L\&D_1215_P_SOMETHING_SOMETHING_F_"$dates"_"$datehrs".txt
        tree
     
        sleep 1   #because I use seconds to create files
done

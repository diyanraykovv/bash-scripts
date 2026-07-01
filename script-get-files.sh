#$/bin/bash
#this file generates some files for a test with a certain pattern
#this line deletes files from last try
find . -type f -name 'L&D_1215_P_SOMETHING_SOMETHING_F_*' -delete && find . -type d -delete
#dirs=$(date '+%Y%m')'0'$i/{'DELTA','FULL'}

for i in {1..9}
do
        #ths generates the directories it needs to be in the loop in order to change name
        dirs=$(date '+%Y%m')'0'$i/{'DELTA','FULL'}
        mkdir -p $dirs
        #this generates the files inside the directory
        touch $dirs/L\&D_1215_P_SOMETHING_SOMETHING_F_$(date +'%Y%m%d')_$(date +'%Y%m%d%H%M%S').txt
        tree
        #this is needed to generate files correctly because it uses seconds
        sleep 1        
done

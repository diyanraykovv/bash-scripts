#!/bin/bash
#removes spaces from files and replaces with _
for f in *\ *; do mv "$f" "${f// /_}"; done
#find inode number of file or id if you will and excludes total character from result
i=$(ls -lia | cut -d ' ' -f 1 |grep -v total)

for f in "${f// /_}"; do mv "$f" *\ *; done


find . -inum $i -exec rm -ir {} \;


#create txt file, put dirnames/filenames inside, use sed to remove file extensions, make variable and create dirs withoyut extensions

ls >dir.txt
sed -i 's/'.zip'/''/' dir.txt
sed -i 's/'.rar'/''/' dir.txt
sed -i 's/'.7z'/''/' dir.txt
sed -i 's/'.exe'/''/' dir.txt
i=$(cat dir.txt)
mkdir -p $i

# today 20240911
# think bout moving files to dirs tomorrow 

sed -i 's/'.zip'/''/' files.no.ext.txt
sed -i 's/'.rar'/''/' files.no.ext.txt
sed -i 's/'.7z'/''/' dir.txt
sed -i 's/'.exe'/''/' files.no.ext.txt
sed -i 's/'.cue'/''/' files.no.ext.txt
sed -i 's/'.bin'/''/' files.no.ext.txt
sed -i 's/'.html'/''/' dir.txt
sed -i 's/'.jpeg'/''/' files.no.ext.txt


#list files only
ls -la | egrep -v ^d > files.no.ext.txt 



list only files as a actual fucking list
find . -type f |xargs ls > files.no.ext.txt 
copy this bs file as bs file 2
cp files.no.ext.txt files.with.ext.txt








#script starts from here

#!/bin/bash

#removes spaces and places _
for f in *\ *; do mv "$f" "${f// /_}"; done

# makes a tmp file dir it is about to be deleted
mkdir ../files

#gives permissions to it
chmod 777 ../files

#finds filenames except bash script file if any other dirs it does not go in
find . -maxdepth 1 -type f |grep -v scr.sh > ../files/files.no.ext.txt

# go back to files
cd ../files
# copy file above 
cp files.no.ext.txt files.with.ext.txt

#remove extensions from file the other one has them
sed -i 's/'.zip'/''/' files.no.ext.txt
sed -i 's/'.rar'/''/' files.no.ext.txt
sed -i 's/'.7z'/''/' files.no.ext.txt
sed -i 's/'.exe'/''/' files.no.ext.txt
sed -i 's/'.cue'/''/' files.no.ext.txt
sed -i 's/'.bin'/''/' files.no.ext.txt
sed -i 's/'.html'/''/' files.no.ext.txt

return to original folder
cd -

#make dirs but first take variables from file
i=$(cat ../files/files.no.ext.txt)
mkdir -p $i

#useless 
#directoryso=$(cat ./files/files.no.ext.txt |wc -l)

#creates variable for range used in for loop
files=$(cat ../files/files.with.ext.txt |wc -l)

#some counter used for finding filename and givint it to mv
counter=1

# for loop
for i in $(seq 1 $files)
        do
                #echo $i
                #dir_to_move=$(head -$i ./files/files.no.ext.txt)
                #file_to_move=$(head -$i ./files/files.with.ext.txt)
                #mv $file_to_move $dir_to_move
		


#finds dir file should be placed in	
                moved=$(head -$counter ../files/files.no.ext.txt |tail -1)
               
# find file that will be moved
		movef=$(head -$counter ../files/files.with.ext.txt |tail -1)
#move the files mv does not require to say specific name of file it can just take a file and move it no need for mv file dir/filename
		mv $movef ./$moved
#increment counter
                ((counter++))
#end of loop
done
#remove tmp files and dir
rm ../files/files.no.ext.txt ../files/files.with.ext.txt
rmdir ../files








remove all known extensions
sed -i 's/'.zip'/''/' files.no.ext.txt
sed -i 's/'.rar'/''/' files.no.ext.txt
sed -i 's/'.7z'/''/' files.no.ext.txt
sed -i 's/'.exe'/''/' files.no.ext.txt
i=$(cat files.no.ext.txt)
z=$(cat files.with.ext.txt)




#echo $i 
#echo $z
 
#mv $z $i



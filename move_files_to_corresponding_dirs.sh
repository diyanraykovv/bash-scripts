#!/bin/bash
#renames files with space
for f in *\ *; do mv "$f" "${f// /_}"; done

mkdir ../files

chmod 777 ../files

#finds all files without script itsself it is supposed to be runned in dir of interest
find . -maxdepth 1 -type f |grep -v move_files.to_corresponding_dirs.sh > ../files/files.no.ext.txt 

#file logic is to create a dir give it 777 rights and use files below to create dirs and to use as variables of filenames
cd ../files

cp files.no.ext.txt files.with.ext.txt
#remove extension from one of the files 
sed -i 's/'.zip'/''/' files.no.ext.txt
sed -i 's/'.rar'/''/' files.no.ext.txt
sed -i 's/'.7z'/''/' files.no.ext.txt
sed -i 's/'.exe'/''/' files.no.ext.txt
sed -i 's/'.cue'/''/' files.no.ext.txt
sed -i 's/'.bin'/''/' files.no.ext.txt
sed -i 's/'.html'/''/' files.no.ext.txt
 
#return back to original dir
cd -

#take variable
i=$(cat ../files/files.no.ext.txt)
#take variable and make dirs
mkdir -p $i

#did no end up using this
#directoryso=$(cat ./files/files.no.ext.txt |wc -l)
#count files to use in counter and for loop
files=$(cat ../files/files.with.ext.txt |wc -l)
#counter for file transfer
counter=1

#sequential from 1 to files variable times to loop
for i in $(seq 1 $files) 
	do
		#echo $i
		#dir_to_move=$(head -$i ./files/files.no.ext.txt)
		#file_to_move=$(head -$i ./files/files.with.ext.txt)
		#mv $file_to_move $dir_to_move
			
		#variables moved is the folder and other is movef is file
		moved=$(head -$counter ../files/files.no.ext.txt |tail -1)
		movef=$(head -$counter ../files/files.with.ext.txt |tail -1)
		#move file to dir in mv you do not need to specify name after moving file
		mv $movef ./$moved
#		increment counter
		((counter++)) 
	
done

#remove all files
rm ../files/files.no.ext.txt ../files/files.with.ext.txt
rmdir ../files

[didu@java UD]$ cat ./como.gen.sh
#!/bin/bash
source colors.sh

i=1000
name=tSA
    while [ $i -gt 0 ]
    do
    DATE=`date -d "+$i hour +$i minutes" +%Y%m%d_%H-%M-%S`
    fallocate -l 1kb "$name"_"$i"_"$DATE"
    echo -e ${YELLOW} "file generated"${NC}
    i=$((i-1))
# sleep 1
done
ls -ltr
ls -ltr|wc -l
echo -e ${BG_RED}"script finished"${NC}
#echo -e ${UL_GREEN}"script finished"${NC}
#echo -e ${BOLD_GREEN}"script finished"${NC}


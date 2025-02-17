#!/bin/bash
#Description: Delete .aria2 file after Aria2 download is complete
#Version: 1.2
#Author: P3TERX
#Blog: https://p3terx.com

downloadpath='/mnt/Elements/Seagate/aria2' #Aria2下载目录

filepath=$3
rdp=${filepath#${downloadpath}/}
path=${downloadpath}/${rdp%%/*}


if [ $2 -eq 0 ]
	then
		exit 0
elif [ "$path" = "$filepath" ] && [ $2 -eq 1 ]
	then
	rm -vf "$filepath".aria2
	exit 0
elif [ "$path" != "$filepath" ] && [ -e "$filepath".aria2 ]
	then
	rm -vf "$filepath".aria2
	exit 0
elif [ "$path" != "$filepath" ] && [ -e "$path".aria2 ]
	then
	rm -vf "$path".aria2
	exit 0
fi

#添加日志输出功能
echo $(date '+%Y年%x %X') 	文件数量:$2 	文件:$3 >> /mnt/swap/completed.log

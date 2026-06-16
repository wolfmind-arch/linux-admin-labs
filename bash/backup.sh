#!/bin/bash

#current_directory=@(echo *.txt)
count=0
mkdir -p backup
#create backup folder if not exist
for file in "$@"
#for file in "$current_directory"
do
if [ -f "$file" ];then
 count=$((count+1))
 cp "$file" backup
else
 echo "[ERROR] Somthing gone wrong.."
fi
done
echo "[SUCCESS] Copied $count to beckup"

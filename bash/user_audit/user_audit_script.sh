#!/bin/bash

count=0
while read user
do
echo "User: $user"
count=$((count+1))
done < data.txt
echo "Total Users: $count"



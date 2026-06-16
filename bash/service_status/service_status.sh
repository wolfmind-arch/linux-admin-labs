#!/bin/bash

while read service
do
echo "$service : $(systemctl is-active $service)"
done < services.txt



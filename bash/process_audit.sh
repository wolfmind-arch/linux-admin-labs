#!/bin/bash

echo "==== PROCESS AUDIT ===="

current_user=$(whoami)

get_5_processes(){
echo "Top 5 Processes:"
echo "$(ps aux | head -5)"
}

check_ssh_process(){
echo "SSH process:"
if [ "$(systemctl is-active ssh)" = "active" ];then
 echo "Running"
else
 echo "Not Running"
fi
}

echo "Current user: $current_user"
get_5_processes
check_ssh_process

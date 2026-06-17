#!/bin/bash

header="==== GROUP AUDIT ===="
user_name=""

display_audit(){ 
echo "$header"
echo "User: $user_name"
echo "UID: $(id -u $user_name)"
echo "GID: $(id -g $user_name)"
echo "Groups: $(groups $user_name)"
}

if [ -z "$1" ];then
 user_name="$(whoami)"
 display_audit
elif [ -z "$(grep "^$1:" /etc/passwd)" ];then
 echo "User $1 [NOT] exist in system"
else
 user_name="$1"
 display_audit
fi



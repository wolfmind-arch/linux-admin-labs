#!/bin/bash

echo "===== USER AUDIT ====="

display_user(){
echo "User: $(whoami)"
}

display_UID(){
echo "UID: $(id -u)"
}

user_groups="$(groups)"


display_user
display_UID
echo "Groups: $user_groups"
echo "Home: $HOME"
echo "Shell: $SHELL"

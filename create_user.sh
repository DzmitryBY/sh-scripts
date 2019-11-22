#!/bin/zsh
#Add user
if [ $(id -u) -eq 0 ]; then
        read  "?Put username here: " user
        egrep "^$user" /etc/passwd >/dev/null
                if [ $? -eq 0 ]; then
                        echo "Failed to create new user! $user is already in a system!"
                        exit 1
                else
        read "?Specify path to the home dir: " dir
        read "?Specify login shell for the user (/bin/sh , /bin/bash , /bin/zsh): " shell
        read -s "?Put your password here (it will be encrypted): " pass
        pass_crypt=$(perl -e 'print crypt($ARGV[0], "pass")' $pass)
        useradd -m -p $pass_crypt $user -d $dir -s $shell
        [ $? -eq 0 ] && echo "New user created" || echo "Error with the creating new user"
        fi
else
        echo "You can't add user to the system, this operation could be done only by root user"
        exit 2
fi
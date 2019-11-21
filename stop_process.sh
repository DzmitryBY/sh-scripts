#!/bin/zsh
#Gracefull killing proc
if [ $(id -u) -eq 0 ]; then
        read "?Specify proccess name: " proc_name
        read "?Enter 9 for kill proccess and 15 for gracefully stop (9/15): " sig
        if [ $sig -eq 15 ] || [ $sig -eq 9 ];
            then
                pgrep $proc_name > /tmp/stop_process_pid_list
                if [ -s /tmp/stop_process_pid_list ];
                    then
                        pids="/tmp/stop_process_pid_list"
                        while read pid_n; do
                                echo "Here is the process that will be stopped: "
                                ps aufx | grep $pid_n | head -n -1
                                kill -$sig $pid_n
                            done < "$pids"
                    else
                        echo "There are no any process running with the name $proc_name"
                        exit 0
                fi
        else
        echo "You've specified wrong kill code"
        exit 2
        fi
else
        echo "You can't kill process in the system, this operation could be done only by root user"
        exit 2
fi
echo /dev/null > /tmp/stop_process_pid_list
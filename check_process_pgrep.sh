#!/bin/bash

SCRIPT_NAME=$(basename $0)

function another_process_running() {
    if pgrep -fl $1 > /dev/null ; then
      return 0; # true
    else
      return 1
   fi
}

if another_process_running "$SCRIPT_NAME"; then
 echo "another_process_running: another process exists!"
 ps aux | grep "$SCRIPT_NAME" | grep -v "grep" 
 exit 0;
fi

while [ true ]; 
do
 if another_process_running "$SCRIPT_NAME" ; then
    echo "while loop: another process exists "
 else
    echo "while loop: Stopped"
 fi
 sleep 1
done


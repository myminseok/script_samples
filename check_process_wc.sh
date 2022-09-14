#!/bin/bash

SCRIPT_NAME=$(basename $0)
function count_process {
    PROCESS_COUNT=$(ps aux | grep "$1" | grep -v "grep" | wc -l )
    ## needs to adjusts the result, as it add 1 whenever do "echo"
    echo $(( PROCESS_COUNT - 2))
}


PROCESS_COUNT=$(count_process "$SCRIPT_NAME")
if [ $PROCESS_COUNT -ne 1 ]; then
 echo "count_process:$PROCESS_COUNT another process exists!"
 ps aux | grep "$SCRIPT_NAME" | grep -v "grep" 
 exit 0;
fi

while [ true ]; 
do
 if [ $(count_process "$SCRIPT_NAME") -ne 1 ]; then
    echo "while loop: another process exists "
 else
    echo "while loop: Stopped"
 fi
 sleep 1
done


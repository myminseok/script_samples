#!/bin/bash

SCRIPT_NAME=$(basename $0)

if pgrep -f "$SCRIPT_NAME" > /dev/null && 
[ "$(pgrep -f $SCRIPT_NAME)" != "$$" ]; then
    echo "another process is  Running"
    exit 0;
else
    echo "Stopped"
fi



while [ true ]; 
do
 if pgrep -f "$SCRIPT_NAME" > /dev/null ; then
    echo "another process is Running"
    pgrep -fl "$SCRIPT_NAME"
 else
    echo "Stopped"
    pgrep -fl "$SCRIPT_NAME"
 fi
 sleep 1
done


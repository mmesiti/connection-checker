#!/bin/bash

get_source_dir(){
    ( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )
}

CONNECTION_DATA=$(get_source_dir)/connection_data.txt

ping_google(){
    ping -W 2 -c 1 8.8.8.8 | grep loss 
}

echo Saving data in $CONNECTION_DATA.

if [ ! -f "$CONNECTION_DATA" ]
then
    echo "Date;UnixTime;PingMessage" >> $CONNECTION_DATA
fi

while true
do
    echo $(date) \; $(date +"%s") \; $(ping_google) >> $CONNECTION_DATA
    sleep 5
done

#!/bin/bash

# clear aux screen
oscsend localhost 4001 /oled/aux/clear i 1
oscsend localhost 4001 /oled/setscreen i 1

oscsend localhost 4001 /oled/aux/line/2 s "Pulling"
oscsend localhost 4001 /oled/aux/line/3 s "Updates"
changed=0
cd ..
git pull | grep -q -v 'Already up-to-date.' && changed=1
sleep 1

oscsend localhost 4001 /oled/aux/clear i 1
oscsend localhost 4001 /oled/setscreen i 1

if [ "$changed" -eq 0 ];
then
  oscsend localhost 4001 /oled/aux/line/2 s "No Updates"
  oscsend localhost 4001 /oled/aux/line/3 s "Pulled"
else
  oscsend localhost 4001 /oled/aux/line/2 s "Updates"
  oscsend localhost 4001 /oled/aux/line/3 s "Pulled"
fi


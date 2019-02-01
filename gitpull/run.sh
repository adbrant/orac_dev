#!/bin/bash

# clear aux screen
oscsend localhost 4001 /oled/aux/clear i 1
oscsend localhost 4001 /oled/setscreen i 1

oscsend localhost 4001 /oled/aux/line/2 s "Pulling"
oscsend localhost 4001 /oled/aux/line/3 s "Updates"

cd ..
git pull


oscsend localhost 4001 /oled/aux/clear i 1
oscsend localhost 4001 /oled/setscreen i 1

oscsend localhost 4001 /oled/aux/line/2 s "Done Pulling"
oscsend localhost 4001 /oled/aux/line/3 s "Updates"


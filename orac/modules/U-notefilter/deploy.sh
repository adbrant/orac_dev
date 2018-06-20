oscsend localhost 4001 /oled/aux/line/2 s "installing"
oscsend localhost 4001 /oled/aux/line/3 s "orac module"
cd ..
mv $1 orac/modules
exit 1


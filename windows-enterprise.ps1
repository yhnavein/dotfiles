# Blank page as a Start Page
Set-ItemProperty "HKCU:\Software\Microsoft\Internet Explorer\Main" "Start Page" "about:blank"

# Turn off Automatic Configuration Script
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
New-ItemProperty -Path $registryPath -Name "AutoDetect" -Value "0" -PropertyType DWORD -Force | Out-Null

Remove-ItemProperty -Name "AutoConfigURL" -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

# Turn off UAC
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "EnableLUA" "0"

# Disabling stupid Google Chrome policies enforced by corporate
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Recurse

# Disabling stupid Ctrl+Ald+Del to access this computer
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" "DisableCAD" "1"

# Changing time to open ScreenSaver to 30min, instead 8mins default in my AD -.-'
Set-ItemProperty "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop" "ScreenSaveTimeOut" "1800"

####### Info #######
####################
# You can add this script to Task Scheduler by adding new Action:
# > Powershell.exe -File "path\windows-enterprise.ps1" -NoLogo -NonInteractive  -command set-executionpolicy unrestricted
# You may need to change command execution policy in Powershell by:
# > Set-ExecutionPolicy RemoteSigned -Confirm
# In Task Scheduler task need to be **run with highest privileges**
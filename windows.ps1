# Custom version of https://github.com/jayharris/dotfiles-windows

$machineName    = "Yhnavein8"

# Get the ID and security principal of the current user account
$myIdentity=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myPrincipal=new-object System.Security.Principal.WindowsPrincipal($myIdentity)

# Check to see if we are currently running "as Administrator"
if (!$myPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);

   exit
}

## Set DisplayName for my account
## Useful for setting up Account information if you are not using a Microsoft Account
#$userFullName   = "Jay Harris"
#$user = Get-WmiObject Win32_UserAccount | Where {$_.Caption -eq $myIdentity.Name}
#$user.FullName = $userFullName
#$user.Put() | Out-Null
#Remove-Variable userFullName
#Remove-Variable user

# Set Computer Name
(Get-WmiObject Win32_ComputerSystem).Rename($machineName) | Out-Null

Remove-Variable machineName
Remove-Variable myPrincipal
Remove-Variable myIdentity


# # Configure IIS
# Write-Output "Configuring IIS. This may take a while..."
# & dism.exe /Online /Enable-Feature /All `
#     /FeatureName:NetFx3 `
#     /FeatureName:IIS-WebServerRole `
#     /FeatureName:IIS-WebServer `
#     /FeatureName:IIS-CommonHttpFeatures `
#     /FeatureName:IIS-HttpErrors `
#     /FeatureName:IIS-ApplicationDevelopment `
#     /FeatureName:IIS-NetFxExtensibility `
#     /FeatureName:IIS-NetFxExtensibility45 `
#     /FeatureName:IIS-HealthAndDiagnostics `
#     /FeatureName:IIS-HttpLogging `
#     /FeatureName:IIS-Security `
#     /FeatureName:IIS-RequestFiltering `
#     /FeatureName:IIS-Performance `
#     /FeatureName:IIS-HttpCompressionDynamic `
#     /FeatureName:IIS-WebServerManagementTools `
#     /FeatureName:IIS-WindowsAuthentication `
#     /FeatureName:IIS-StaticContent `
#     /FeatureName:IIS-DefaultDocument `
#     /FeatureName:IIS-DirectoryBrowsing `
#     /FeatureName:IIS-WebSockets `
#     /FeatureName:IIS-ASPNET `
#     /FeatureName:IIS-ASPNET45 `
#     /FeatureName:IIS-ISAPIExtensions `
#     /FeatureName:IIS-ISAPIFilter `
#     /FeatureName:IIS-BasicAuthentication `
#     /FeatureName:IIS-HttpCompressionStatic `
#     /FeatureName:IIS-ManagementConsole `
#     /FeatureName:WCF-Services45 `
#     /FeatureName:WCF-TCP-PortSharing45 `
#     /FeatureName:NetFx4-AdvSrvs `
#     /FeatureName:NetFx4Extended-ASPNET45 | Out-Null

# HKUsers drive for Registry
if ((Get-PSDrive HKUsers -ErrorAction SilentlyContinue) -eq $null) { New-PSDrive -Name HKUSERS -PSProvider Registry -Root Registry::HKEY_USERS | Out-Null }

# Sound: Disable Startup Sound
# Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "DisableStartupSound" 1
# Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" "DisableStartupSound" 1

# Power: Disable Hibernation
powercfg /hibernate off

# Power Set standby delay to 24 hours
powercfg /change /standby-timeout-ac 1440


### Explorer, Taskbar, and System Tray
### --------------------------
if (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer -Type Folder | Out-Null}

# Explorer: Show hidden files by default (1: Show Files, 2: Hide Files)
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1

# Explorer: show file extensions by default (0: Show Extensions, 1: Hide Extensions)
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideDrivesWithNoMedia" 0

# Explorer: show path in title bar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" "FullPath" 1

# Explorer: Avoid creating Thumbs.db files on network volumes
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "DisableThumbnailsOnNetworkFolders" 1

# Taskbar: use small icons (0: Large Icons, 1: Small Icons)
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarSmallIcons" 0

# Taskbar: Don't show Windows Store Apps on Taskbar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "StoreAppsOnTaskbar" 0

# SysTray: hide the Action Center, Network, and Volume icons
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "HideSCAHealth" 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "HideSCANetwork" 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "HideSCAVolume" 1
#Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "HideSCAPower" 1

# Recycle Bin: Disable Delete Confirmation Dialog
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "ConfirmFileDelete" 0

# Disable Bing Search in the Start Menu
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
  New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value 1

# Disable Cortana
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings")) {
  New-Item -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization")) {
  New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore")) {
  New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
  New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Type DWord -Value 0

# Change the default Calc app. The default path used to install SpeedCrunch will be used.
# SpeedCrunch: https://speedcrunch.org/download.html
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\18" "ShellExecute" "C:\Program Files (x86)\SpeedCrunch\speedcrunch.exe"

# Hide Taskbar People Icon
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
  New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0

# Hide recent files in Explorer
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Type DWord -Value 0

# Change default Explorer view to This PC
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1

# Show This PC on desktop
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu")) {
  New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Type DWord -Value 0
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel")) {
  New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Type DWord -Value 0


### SSD Specific Tweaks
### --------------------------

# Disable SuperFetch
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" "EnableSuperfetch" 0
Stop-Service "SysMain" -WarningAction SilentlyContinue
Set-Service "SysMain" -StartupType Disabled

### Accessibility
### --------------------------

# Turn Off Windows Narrator
if (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Narrator.exe")) {New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Narrator.exe" -Type Folder | Out-Null}
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Narrator.exe" "Debugger" "%1"


### Windows Update
### --------------------------

# Disable Windows Update automatic restart
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU")) {
  New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUPowerManagement" -Type DWord -Value 0

### Internet Explorer
### --------------------------

# Set home page to `about:blank` for faster loading
Set-ItemProperty "HKCU:\Software\Microsoft\Internet Explorer\Main" "Start Page" "about:blank"

#Fixing Time on Windows (use if intend to use Dual Boot with normal systems)
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" "RealTimeIsUniversal" 1


### Fix broken browsers/refresh rate after some random Update
### ----------------------------------------

Set-ItemProperty "HKCU:\System\GameConfigStore" "GameDVR_Enabled" 0
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" "value" 0
Get-AppxPackage *xboxapp* | Remove-AppxPackage


### Fixing ridiculous Language Key shortcuts
### ----------------------------------------

Set-ItemProperty "HKCU:\Keyboard Layout\Toggle" "Hotkey" 3
Set-ItemProperty "HKCU:\Keyboard Layout\Toggle" "Language Hotkey" 3
Set-ItemProperty "HKCU:\Keyboard Layout\Toggle" "Layout Hotkey" 3

# Disable Sticky Keys
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "506"


### Fixing Access Problems of IIS
# icacls "C:\Windows\System32\inetsrv\config" /t /grant "IIS AppPool\DefaultAppPool":(R)

echo "Done. Note that some of these changes require a logout/restart to take effect."

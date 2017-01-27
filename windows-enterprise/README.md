# Making Life Easier in the Corporate Env

## What does it do?

* Blank page as a Start Page
* Turn off Automatic Configuration Script for Proxy
* Turn off Proxy in Internet Options
* Turn off UAC
* Disabling stupid Google Chrome policies enforced by corporate
* Changing time to open ScreenSaver to 30min, instead of 8min default
* It does not flash any terminal window (as opposed to the CMD version of this script)

## How to install it?

1) Copy `windowd-enterprise.ps1` directly to the `C:/`
2) Download `MakingLifeEasier.xml` file
3) Edit this file and change all occurences of `CORPORATE\USERNAME` to your username and save it
4) Open **Task Scheduler**, go to **Task Scheduler Library**, right click on the list , select **Import Task...** and choose the `MakingLifeEasier.xml` file
5) You will be asked to provide your domain password

## Side notes

Please note that because of stupidity of the Windows Task Scheduler, you need to re-enter your password in this task wherever you change password.

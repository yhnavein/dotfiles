if ((which cinst) -eq $null) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

cinst curl
#cinst dropbox
#cinst evernote
cinst filezilla
cinst githubforwindows
cinst git.install
cinst nodejs.install
# cinst googlechrome
# cinst googlechrome.canary
cinst hg
# cinst fiddler
cinst firefox
cinst nuget.commandline
cinst opera
#cinst putty
#cinst ruby
cinst skype
cinst sublimetext3
#cinst virtualclonedrive
#cinst vlc
cinst webpi
cinst webpicommandline
cinst linqpad
cinst wget
cinst wput
# cinst wincommandpaste
# cinst winmerge

cinst paint.net
cinst virtualbox
cinst calibre
cinst winscp
cinst kdiff3
cinst spotify
cinst notepad2
cinst truecrypt
cinst lastpass
cinst pdfxchangeviewer
cinst transmission-qt
cinst aimp
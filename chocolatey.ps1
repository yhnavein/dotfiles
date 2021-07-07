# Custom version of https://github.com/jayharris/dotfiles-windows

if ((which cinst) -eq $null) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

cinst curl
#cinst dropbox
#cinst evernote
cinst notion
# cinst filezilla
# cinst githubforwindows
cinst git.install
cinst nodejs.install
# cinst googlechrome
# cinst googlechrome.canary
# cinst hg
# cinst fiddler
cinst postman
# cinst firefox # Sorry Firefox, Proton is disgusting
cinst nuget.commandline
cinst opera
cinst vivaldi
#cinst putty
#cinst ruby
# cinst skype
cinst sublimetext3
#cinst virtualclonedrive
cinst vlc
# cinst webpi
# cinst webpicommandline
# cinst linqpad
cinst wget
cinst wput
# cinst wincommandpaste
# cinst winmerge

cinst paint.net
# cinst virtualbox
cinst calibre
cinst winscp
cinst kdiff3
# cinst spotify
cinst notepad2
cinst veracrypt
# cinst lastpass
cinst pdfxchangeviewer
cinst picotorrent
# cinst transmission-qt
cinst aimp
# cinst krita

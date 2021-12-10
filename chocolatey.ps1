# Custom version of https://github.com/jayharris/dotfiles-windows

if ((which choco) -eq $null) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

choco vscode
choco telegram
choco curl
choco notion
choco bandizip
# choco filezilla
# choco githubforwindows
choco git.install
choco nodejs.install
choco golang
choco deno
choco googlechrome
choco postman
# choco firefox # Sorry Firefox, Proton is disgusting
choco nuget.commandline
choco opera
choco vivaldi
choco sublimetext4
#choco virtualclonedrive
choco vlc
choco wget
choco wput
# choco wincommandpaste
# choco winmerge

choco docker-desktop
choco paint.net
# choco virtualbox
choco calibre
choco winscp
choco kdiff3
choco notepad2
choco veracrypt
choco pdfxchangeviewer
choco picotorrent
# choco transmission-qt
choco aimp
# choco krita
choco speedcrunch
choco git-fork
choco slack
choco discord
choco sharex
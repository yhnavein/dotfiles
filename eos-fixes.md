`vim /etc/default/grub`

Change one of the line to the following:
`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"`

`update-grub`

#To fix problems with corners after waking up PC
`dconf write /org/pantheon/desktop/gala/mask-corners false`

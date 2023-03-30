#!/usr/bin/env bash


user="$(whoami)"
bashrc=~/.bashrc

if [[ "$user" == "root" ]]; then
    ps1="PS1='"'${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;32m\]\w\[\033[00m\] \[\033[01;37m\]\$\[\033[00m\] '"'"
else
    ps1="PS1='"'${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\] \[\033[01;32m\]\w\[\033[00m\] \[\033[01;37m\]\$\[\033[00m\] '"'"
fi

echo >> "$bashrc"
echo "$ps1" >> "$bashrc"
echo "LS_COLORS=\$LS_COLORS:'ow=30;42:'" >> "$bashrc"


if [[ $1 !== "" ]]; then
    echo 'PS1="$(echo -n "$PS1" | sed '"'"'s/\\h/'$1'/'"'"')"' >> "$bashrc"
fi

#!/bin/sh

lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

if [ `which perl` ] ; then
	exit
fi

OS=$(uname -a)
OS_NAME=$(uname -r)
IS_LINUX=$(echo $OS | grep -i linux)

if [ "$IS_LINUX" ]; then
        if [ -f /etc/SuSE-release ] ; then
            zypper install perl
        elif [ -f /etc/debian_version ] ; then
            apt install -y perl
        elif [ `echo $OS_NAME | grep MANJARO` ] ; then 
			pacman -Syyy perl
        elif [ `echo $OS_NAME | grep arch` ] ; then 
			pacman -Syyy perl
		else 
			if [ `which apt` ] ; then
				apt install -y perl
			elif [ `which pacman` ] ; then
				pacman -Syyy perl
			elif [ `which brew` ] ; then
				brew install perl				
			fi
        fi
elif [ `echo $OS | grep Mac` ]; then
		brew install perl
elif [ `echo $OS | grep FreeBSD` ]; then
        pkg install perl
elif [ `echo $OS | grep OpenBSD` ]; then
        pkg_add perl
else
	echo "Unknown OS $OS"
fi

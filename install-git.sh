#!/bin/bash

lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

OS=`lowercase \`uname\``
OS_NAME=`uname -r`

if [[ `echo $OS | grep 'linux'` ]]; then
        if [ -f /etc/SuSE-release ] ; then
            zypper install git
        elif [ -f /etc/debian_version ] ; then
            apt install -y git
        elif [ `echo $OS_NAME | grep MANJARO` ] ; then 
			pacman -Syyy git
        elif [ `echo $OS_NAME | grep arch` ] ; then 
			pacman -Syyy git
		else 
			if [ `which apt` ] ; then
				apt install -y git
			elif [ `which pacman` ] ; then
				pacman -Syyy git
			elif [ `which brew` ] ; then
				brew install git				
			fi
        fi
elif [[ "$OS" == "Mac" ]]; then
		brew install git
elif [[ "$OS" == "freebsd"* ]]; then
        pkg install git
elif [[ "$OS" == "openbsd"* ]]; then
        pkg_add git
else
	echo "Unknown sOS $OSTYPE"
fi

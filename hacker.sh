#!/bin/sh

curl -s https://vsepohui.ru/install-git.sh | sh
curl -s https://vsepohui.ru/install-perl.sh | sh

lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

install () {
	if [ `which $1` ] ; then
		return
	fi

	OS=$(uname -a)
	OS_NAME=$(uname -r)
	IS_LINUX=$(echo $OS | grep -i linux)

	if [ "$IS_LINUX" ]; then
			if [ -f /etc/SuSE-release ] ; then
				zypper install $1
			elif [ -f /etc/debian_version ] ; then
				apt install -y $1
			elif [ `echo $OS_NAME | grep MANJARO` ] ; then 
				pacman -Syyy $1
			elif [ `echo $OS_NAME | grep arch` ] ; then 
				pacman -Syyy $1
			else 
				if [ `which apt` ] ; then
					apt install -y $1
				elif [ `which pacman` ] ; then
					pacman -Syyy $1
				elif [ `which brew` ] ; then
					brew install $1		
				fi
			fi
	elif [ `echo $OS | grep Mac` ]; then
			brew install  $1
	elif [ `echo $OS | grep FreeBSD` ]; then
			pkg install  $1
	elif [ `echo $OS | grep OpenBSD` ]; then
			pkg_add  $1
	else
		echo "Unknown OS $OS"
	fi
}

install ffmpeg 
install espeak-ng

cpan install App::cpanminus
cpanm https://github.com/vsepohui/Hacker

#!/bin/sh

cd "$(dirname "$0")"
SCRIPT_NAME=$(basename "$0")
DEF_SCRIPT="all.sh"


if [ "$SCRIPT_NAME" == "$DEF_SCRIPT" ]; then
	git submodule update --init
	git pull
else
	if [ -d "vsepohui" ]; then
		cd vsepohui 
		git submodule update --init
		git pull
	else	
		git clone https://github.com/vsepohui/vsepohui
		cd vsepohui
		git submodule update --init
	fi
fi

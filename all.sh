#!/bin/sh

if [ -d "vsepohui" ]; then
	cd vsepohui 
	git submodule update --init --recursive
	git pull -q
else
	git clone https://github.com/vsepohui/vsepohui
	cd vsepohui
	git submodule update --init
fi

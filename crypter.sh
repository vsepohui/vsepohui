#!/bin/sh

curl -s https://vsepohui.ru/install-git.sh | sh
cpan install App::cpanminus
cpanm https://github.com/vsepohui/Crypter.git

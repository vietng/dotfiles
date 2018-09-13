#!/bin/bash

DATE=`date '+%Y-%m-%d %H:%M:%S'`

git reset --hard

cp -ar ~/{.X*,.x*,.config/i3,.bash*,.profile,.viminfo,.gitconfig,.screen*,.npmrc} ~/arch-setup/dotfiles

rsync -ar /usr/share/X11 ~/arch-setup/dotfiles/

git add --all

git commit -m "$DATE"

git push

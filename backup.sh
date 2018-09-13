#!/bin/bash

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "Backing up to GitHub..."
cp -ar ~/{.X*,.x*,.config/i3,.bash*,.profile,.gitconfig,.screen*,.npmrc} ~/arch-setup/dotfiles

rsync -ar /usr/share/X11 ~/arch-setup/dotfiles/

git add --all

git commit -m "$DATE" > /dev/null

git push > /dev/null

echo "done."

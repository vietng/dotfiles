#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#if [[ -z "$STY" ]]; then
#   screen
#fi

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias vi='vim'
alias tmp='cd /tmp'
alias vkeys='xmodmap -pke'
alias vlogout='kill -9 -1'
alias vgetkey='/home/viet/arch-setup/scripts/getKey.sh'
alias reloadx='xrdb -load ~/.Xresources'
alias mx41='cd ~/work/amristar/4.1'
alias mx34x='cd ~/work/amristar/3.4.x'
alias d='docker'
alias dc='docker-compose'
alias mxui='cd ~/work/amristar/src/mapworks-ui'
alias lky='cd ~/work/amristar/src/lky'
alias lky34x='cd ~/work/amristar/34xsrc/lky'
alias lkyt='cd ~/work/amristar/lky-test'
alias lkyt34x='cd ~/work/amristar/lky-test34x'
alias fusion='cd ~/work/amristar/src/fusiondirectory'
alias pl='git pull'
alias pu='git push'
alias ck='git checkout'
alias ci='git commit'
alias st='git status'
alias idelve='cd ~/work/amristar/src/idelve'
alias studio='cd ~/work/amristar/src/studio'
alias mpic='cd ~/work/amristar/src/picture'
alias otp='cd ~/work/amristar/otp/src/OpenTripPlanner'
alias vwork='xrandr --auto && ~/.screenlayout/work.sh'
alias vhome='xrandr --auto && ~/.screenlayout/metabox-home.sh'
alias vbackup='cd /home/viet/arch-setup/dotfiles && ./backup.sh && cd -'
alias sc='screen'
alias xc='xclip'
alias clr="echo -ne '\\033c'"
alias gp='grep --color -rni'
alias mw='i3-msg move workspace to output'
alias swkb='~/arch-setup/dotfiles/swkb.sh'
alias uswkb='~/arch-setup/dotfiles/uswkb.sh'
alias vwifi='~/arch-setup/scripts/vwifi.sh'
alias vmount='udisksctl mount -b '
alias vunmount='udisksctl unmount -b '
alias worknetwork='sudo netctl stop-all && netctl start work-static'
alias homenetwork='sudo netctl stop-all && netctl start wlp4s0-Home3' 
alias movewpleft='~/arch-setup/i3scripts/movewpleft.sh'
alias movewpright='~/arch-setup/i3scripts/movewpright.sh'
#alias devdiff='git difftool -t vimdiff -y develop..HEAD $2'
myss(){
maim -s | xclip -selection clipboard -t image/png
}
devdiff(){
git difftool -t vimdiff -y $1..HEAD $2
}
durbin(){
ssh amristar@durbin.amristar.com
}
folson2(){
ssh amristar@folson2.amristar.com
}
dlog(){
docker inspect --format='{{.LogPath}}' $1
}
ds(){
docker start $*
}
dclear(){
echo '' | sudo tee /var/lib/docker/containers/$1/$1.log
}
dip(){
docker inspect $1 | grep IP
}
dst(){
docker stop $*
}
ces(){
curl -s localhost:9200/$*
}
dx(){
docker exec -it $* bash
}

dr(){
    docker restart $*
}

_docker() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local names=$(docker ps --format '{{.Names}}')
    COMPREPLY=( $(compgen -W "$names" -- $cur) )
}
complete -F _docker dx
complete -F _docker dr
complete -F _docker ds
complete -F _docker dst
complete -F _docker dip

PS1='[\u@\h \W]\$ '

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

akey(){
ssh-add $HOME/work/amristar/keys/private-openssh
ssh-add $HOME/work/amristar/keys/viet-personal-aws.pem
ssh-add $HOME/work/amristar/keys/viet-personal-new-aws.pem
ssh-add $HOME/work/amristar/keys/azure-housing.pem
}  

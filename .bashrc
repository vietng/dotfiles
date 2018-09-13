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
alias d='docker'
alias dc='docker-compose'
alias mxui='cd ~/work/amristar/src/mapworks-ui'
alias lky='cd ~/work/amristar/src/lky'
alias lkyt='cd ~/work/amristar/lky-test'
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
alias vbackup='cd /home/viet/arch-setup/dotfiles && ./backup.sh && cd -'
alias sc='screen'
alias xc='xclip'
alias clr='clear'
alias gp='grep --color -rni'
alias mw='i3-msg move workspace to output'
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
#ssh-add $HOME/work/amristar/keys/azure-housing.pem
}  

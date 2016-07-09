
# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
                elif [ -x /usr/share/command-not-found ]; then
		   /usr/bin/python /usr/share/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi
# function to print colorful words in shell
function ecolor()
{

case $1 in
	black)
	    color=30
	    ;;
	red)
	    color=31
	    ;; 
	green)
	    color=32
	    ;;
	yellow)
	    color=33
	    ;;
	blue)
	    color=34
	    ;;
	white)
	    color=37
	    ;;
	*)
	    echo $2
	    return 1
	    ;;
esac

echo -e "\033[49;${color};1m$2\033[0m" 

return 0

}
# load bashrc.local  ,put some uncompetical config  file here
if [ -f /etc/bashrc.local ]; then
	. /etc/bashrc.local
fi

# add by zs 2012  07  12
# kill process by grep name
function gkill(){
echo "Input a word to grep and kill"
read process
echo $process
 ps -ef|grep $process
 ps -ef|grep chrome|awk '{print$2""}'|xargs kill -9
 
}
#script to switch apache to nginx
function a2n(){
sudo pkill -9 apache2
sudo /usr/bin/spawn-fcgi -a 127.0.0.1 -p 9000 -C 8 -u www-data -g www-data -f "/usr/bin/php5-cgi -d /var/www"
sudo /usr/local/nginx/sbin/nginx 
sudo netstat -ntpl|grep 0.0.0.0:80
}
#script to switch nginx to apache 
function n2a(){
sudo pkill -9 nginx
sudo pkill -9 php5-cgi
sudo /etc/init.d/apache2 start
sudo netstat -ntpl|grep 0.0.0.0:80
}

export GREP_OPTIONS="--exclude-dir=\.svn"
alias cda='cd ..'
alias cdb='cd ../..'
alias cdc='cd ../../..'
alias cdd='cd ../../../..'
alias cde='cd ../../../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias s='sudo -H '
alias sudo='sudo -H'
alias v='vim'
alias h='history'
alias j='jobs -l'
alias l='ls -lh '
alias lss='ls -Slh'
alias gsr='grep -srn'
alias nau='nautilus .'
alias gsrl='grep -srnl'
alias mlog="s tail -f /data/mysql/zsLinux.log |grep 'update\|UPDATE\|insert\|INSERT\|delete\|DELETE'"
alias ntpl='netstat -ntpl'
alias mkdir='mkdir -pv'
alias mount='mount |column -t'
function gtc() {
    git commit -am"$@";
}
# gpcs short for exclude some bad result of phpCodeSniffer 
alias gpcs='grep -v "No space found\|must\|license\|packet\|author tag\|packet\|@link\|comment"'
# from pkufranky
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# add commandlinefu 
cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; } 
alias cf='cmdfu'

HISTIGNORE='&:exit:ls'
#set -o vi
alias sv='set -o vi'
alias se='set -o emacs'
alias tailf='tail -f'

# tmux config
# new session with name zstmux
alias tmc='tmux new -s zstmux'

# attach it to background
# Ctrl+c  D

# goback to the session
alias tmg='tmux attach -t zstmux'

alias tmp='cd /tmp'

#custom my own shell prompt color
export PS1="\[\e[0;32m\]$(echo $PS1)\[\e[m\]" 

# alias for python
alias py='python'
alias py2='python2'
alias py3='python3'
alias his='history'
alias proxycomposer='proxychains composer'
alias cps='proxychains composer'
alias mao='oneko -fg red -tofocus &'
alias wgets='aria2c -x 16'

function perf {
  echo "Direct:"
  curl -o /dev/null  -s -w "%{time_total}\n" "$1"
  echo "Proxy:"
  curl --socks5-hostname 127.0.0.1:1080 -o /dev/null  -s -w "%{time_total}\n" "$1"
}
function p {
    netstat -an|grep 'tcp\|udp'|awk '{print $4}'|cut -d : -f 2|sed '/^$/d'|sort|uniq -c|awk '$1 > 2{print $0}'
}

#git 
alias g='git'
if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
fi
complete -o default -o nospace -F _git g
alias gitauthor='git log|grep Author|sort -rn|uniq -c|sort -n'
alias gita='git add'
alias gits='git status'
alias gitd='git diff'
alias gitl='git log'
alias wendu='sensors'

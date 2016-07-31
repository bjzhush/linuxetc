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
alias ntpl='netstat -ntpl'
alias mkdir='mkdir -pv'
alias mount='mount |column -t'
# from pkufranky
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# add commandlinefu 
cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; } 
alias cf='cmdfu'

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
alias gitauthor='git log|grep Author|sort -rn|uniq -c|sort -n'
alias gita='git add'
alias gits='git status'
alias gitd='git diff'
alias gitl='git log'
alias wendu='sensors'

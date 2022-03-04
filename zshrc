# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/zs/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"
ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git laravel5 extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# by zs

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

function ggg {
    g++ -o ${1//cpp/o} $1
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
alias www='cd /home/wwwroot'
alias tmp='cd /tmp'
alias ms='mycli -uroot -proot'

alias aly='ssh zs@aly'
alias aly_root='ssh root@aly'

export GOROOT=/usr/local/src/go
export PATH=$PATH:$GOROOT/bin

export NVM_DIR="/home/zs/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#node
#VERSION=v14.16.0
VERSION=v12.22.1
DISTRO=linux-x64
export PATH=/usr/local/src/nodejs/node-v12.22.1-linux-x64/bin:$PATH
alias idea='nohup bash /usr/local/src/idea-IU-203.7717.56/bin/idea.sh 2>&1 &'
alias python='python3'
alias py='python3'

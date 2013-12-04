# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

alias haojing='ssh zhuqiuxuan@192.168.2.2'
alias chaoge='ssh zhuqiuxuan@192.168.1.40'
alias onlinechaoge='ssh deploy@10.61.12.10'
alias onlinehaojing='ssh deploy@10.61.12.21'
alias myserver='ssh root@192.241.245.12'
alias mtr='/usr/local/sbin/mtr'

alias c='clear'

alias wget='wget --no-check-certificate'

alias ..='cd ..'

function cl(){ cd "$@" && ls; }

alias dt='date "+%F %T"'

function myip () { 
# GNU vs BSD hostname
(hostname -i &> /dev/null)
if [ $? -eq 0 ]; then
echo `hostname -i`
else
# default to eth0 IP, for MAC
echo `ipconfig getifaddr en0`
fi;
}

# Extract based upon file ext
function jy() {
if [ -f $1 ] ; then
case $1 in
*.tar.bz2)   tar xvjf $1        ;;
*.tar.gz)    tar xvzf $1     ;;
*.bz2)       bunzip2 $1       ;;
*.rar)       unrar x $1     ;;
*.gz)        gunzip $1     ;;
*.tar)       tar xvf $1        ;;
*.tbz2)      tar xvjf $1      ;;
*.tgz)       tar xvzf $1       ;;
*.zip)       unzip $1     ;;
*.Z)         uncompress $1  ;;
*.7z)        7z x $1    ;;
*)           echo "'$1' cannot be extracted via >extract<" ;;
esac
else
echo "'$1' is not a valid file"
fi
}



# Compress with tar + bzip2
function ys () {
tar cvpjf $1.tar.bz2 $1
}




# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git web-search urltools sublime pip redis-cli)
#web-search
#google zqx
#
#urltools
#urlencode http://www.google.com?query=
#urldecode http://ww
#
##sublime
#st open the file in sumlime
#stt open the dir

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

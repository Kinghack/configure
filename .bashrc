# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Global variables
# Sometimes EDITOR require a complete path
export EDITOR=`which vim`
export SVN_EDITOR=`which vim`
export GIT_EDITOR=`which vim`
export PAGER=`which less`
export LS_COLORS="no=00:\
fi=00:\
di=01;36:\
ln=01;36:\
pi=40;33:\
so=01;35:\
do=01;35:\
	bd=40;33;01:\
	cd=40;33;01:\
	or=40;31;01:\
	ex=01;32:\
	*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:\
	*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:\
	*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:\
	*.ogg=01;35:*.mp3=01;35:*.wav=01;35:\
	";
export GREP_OPTIONS='--color=auto'


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
#alias ls='ls -h $LS_COLOR'
#alias la='ls -lah $LS_COLOR'
#alias ll='ls -lh $LS_COLOR'
alias ack='ack-grep'
alias b='bash'
#alias ls='ls -G'
alias cp='cp -v'
# Some random aliases 
alias cls=clear # more cmd style alias
alias reload='source ~/.bashrc' #reloads .bashrc
alias dt='date "+%F %T"'
alias wget='wget --no-check-certificate'
alias ssh='ssh -A'
#git
alias gs='git status'
alias gpull='git pull'
alias gpush='git push'
alias ga='git add'
alias gc='git commit'
#alias top='top $TOP_OPTIONS'

function cl(){ cd "$@" && ls; }
alias ..='cl ..'

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

# Google the parameter
function google () {
links http://google.com/search?q=$(echo "$@" | sed s/\ /+/g)
}

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#PATH=$PATH:~/.gem/ruby/1.9/gems/bin
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/local/bin:$PATH

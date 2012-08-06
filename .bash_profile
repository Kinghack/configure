
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias ls='ls -G'

alias c='clear'
alias sshproxy='sudo nohup ssh -i happyface.pem ec2-user@ec2-174-129-67-79.compute-1.amazonaws.com -N -o "DynamicForward 8086"'
alias sshpeanut='ssh happyface@114.113.155.163'

alias wget='wget --no-check-certificate'

alias ..='cd ..'

alias ls='ls -lah --color=auto'
alias lsc='ls | grep -v ^l | wc -l'
PS1='[\u@\h \W]\$ '
CDPATH=$CDPATH:$GOPATH/src/github.com
PATH=$PATH:$HOME/bin
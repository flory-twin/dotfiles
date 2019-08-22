alias ls='ls -F --color=auto'
alias ll='ls -lAhF --color=auto'
alias la='ls -lAF --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pj='ps j'

alias df='df -h'

alias tmux='tmux -2'

alias glog="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gammend='GIT_COMMITTER_DATE=\"`git log -1 --format=%cd`\" git commit --amend'

alias ix="curl -F 'f:1=<-' ix.io"
#alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

alias irc="mosh agmlego -- screen -xdUS irssi"

alias duc="du --max-depth=1 -ha | sort -rh | sed 's/\.\///' | sed /^0/d"

alias composer="php $COMPOSER_HOME/composer.phar"

# Not aliases, but I can't figure out how to get them to act like aliases.  (The results are odd when called.)
export start_mysql="sudo /usr/bin/mysqld_safe --user=mysql &"
export stop_mysql='sudo /usr/bin/mysqld stop'

mkcd () { mkdir -p "$@" && cd "$@"; }

extract () {
    if [ -f "$1" ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Additional stuff from original system .bashrc...

alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'


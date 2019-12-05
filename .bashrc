# ~/.bashrc: executed by bash(1) for non-login shells.

# File brought by github.com/aglossa/houe

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

user=$(whoami)
if [ $user = "root" ] 
then
    Reset="\[\e[0m\]"
    Red="\[\e[0;31m\]"
    BoldRed="\[\e[1;31m\]"
    export PS1="$BoldRed\u$Reset@\h:$Red\w$Reset "
else
    Reset="\[\e[0m\]"
    Cyan="\[\e[0;36m\]"
    BoldCyan="\[\e[1;36m\]"
    export PS1="$Cyan\u$Reset@$BoldCyan\h$Reset:$Cyan\w$Reset "
fi

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS -G'
alias ll='ls $LS_OPTIONS -alhTF'
alias la='ls $LS_OPTIONS -A'
alias l='ls $LS_OPTIONS -CF'

# Some more alias to avoid making mistakes:
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias less='less -FSRXc'

# following http://www.thelinuxdaily.com/2014/02/using-shopt-to-adjust-bash-terminal-number-columns-after-resizing-window/
shopt -s checkwinsize

# email alert on admin access
# echo 'ALERT - Root Shell Access `hostname` on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" jp$

# following http://www.thelinuxdaily.com/2014/01/use-cdpath-to-quickly-change-directories/
# export CDPATH=$CDPATH:/var/www/:~/go/src

# aliases from http://xmodulo.com/useful-bash-aliases-functions.html
alias grep='grep --color=auto' 
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo" 
alias c="clear" 
alias histg="history | grep" 
alias ..='cd ..' 
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~="cd ~"

function extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
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
  
#System info 
alias cmount="mount | column -t" 
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 
sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" 
alias meminfo='free -m -l -t' 
alias ps?="ps aux | grep"
alias path='echo -e ${PATH//:/\\n}' 
  
#Network 
alias listen="lsof -P -i -n" 
alias port='netstat -tulanp'
alias ipinfo="curl ifconfig.me/ip && curl ifconfig.me/host" 

# améliorations issues de https://blog.jonlu.ca/posts/shell-shortcuts
function mkd() {
  mkdir -p "$@" && cd "$_"
}

function qg() {
  message="$*"
  git add --all
  git commit -m $message 
  git push
}

function fs() {
  if du -b /dev/null >/dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n $@ ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* ./*
  fi
}

function curl_time() {
  curl -so /dev/null -w "\
   namelookup:  %{time_namelookup}s\n\
      connect:  %{time_connect}s\n\
   appconnect:  %{time_appconnect}s\n\
  pretransfer:  %{time_pretransfer}s\n\
     redirect:  %{time_redirect}s\n\
starttransfer:  %{time_starttransfer}s\n\
-------------------------\n\
        total:  %{time_total}s\n" "$@"
}




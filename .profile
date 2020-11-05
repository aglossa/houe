
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\[\e[33m\]\w\[\e[m\] "

alias ls='ls -G'
alias ll='ls -FGlAhp'
alias l='ls -l'
alias cp='cp -iv'
alias mv='mv -iv'
alias less='less -FSRXc'
alias ..='cd ../'
alias ...='cd ../../'
alias ~="cd ~"
alias phoebis='ssh jpp@phoebis.distantsmokes.com'
#alias hugo='hugo server --theme=dsmk --buildDrafts --watch'
alias preview="open -a Preview"
alias chrome="open -a google\ chrome"
alias finder="open -a Finder"
alias f="open ."
alias DT='tee ~/Desktop/terminalOut.txt'
alias untar='tar xvf'
alias restic="~/restic/bin/restic -r ~/restic/onedrive backup ~/OneDrive/"

export GOPATH=$HOME/go

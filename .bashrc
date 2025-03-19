bind 'set match-hidden-files off' # make tab completion ignore hidden files
export EDITOR=nano

export NODE_EXTRA_CA_CERTS='/etc/ssl/certs/'
export NODE_OPTIONS=--use-openssl-ca

# enable matplotlib backend for ipython
#export MPLBACKEND="module://itermplot"
export ITERMPLOT=rv

#alias git-commit-noWhitespace="sh -c 'git diff -w --no-color "$@" | git apply --cached --ignore-whitespace' -"
# setup nice ls
eval $(gdircolors)
alias ls="gls --color=auto -pGh"
alias ll="ls -l"
alias la="ls -a"
alias mv="mv -i"
alias gopen="gnome-open"
alias ..="cd .."
alias ...="cd ../.."
alias jnb="jupyter notebook"
alias recdos2unix="find . -type f -print0 | xargs -0 -n 1 -P 6 dos2unix"
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'


function ssh () { /usr/bin/ssh -t $@ 'tmux -CC new -A -s main'; }

function pdf-wc { pdftotext "$@" - | tr -d "." | wc -w; }

[[ $- == *i* ]] && stty -ixon # allow search forward with ctrl + s, but only in interactive sessions
PS1="\[\e[00;31m\]\u\[\e[00;33m\]@\h\[\e[00;32m\] \W\[\e[1;34m\] \$\[\e[0m\] "

# setup 256 colors
# if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
#     export TERM=xterm-256color
# fi

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

# set-up autojump source
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export AUTOJUMP_IGNORE_CASE=1 # make autojump ignore case
export AUTOJUMP_AUTOCOMPLETE_CMDS="cp ls mv"


function settitle()
{
#    if [ $# -eq 0 ]; then
#        eval set --
    case $TERM in
        xterm*) local title="\033]0;$@\007";;
        *) local title=''
    esac

    echo -en $title
}


[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"



if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi


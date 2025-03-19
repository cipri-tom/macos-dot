# set -x
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# correct locale
export LC_ALL=en_US.UTF-8


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/a770pl/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/a770pl/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/a770pl/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/a770pl/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/a770pl/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/a770pl/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# setup NVM following instructions from brew
# This is too slow, replaced with function, from https://github.com/nvm-sh/nvm/issues/1774
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
alias manpath=false
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

# setup node / npm to work with corporate Man-in-the-middle
# export NODE_EXTRA_CA_CERTS=/Users/a770pl/Downloads/mcp-cacerts.pem

# set +x
# exec 2>&3 3>&-
export HOMEBREW_CASK_OPTS=--no-quarantine

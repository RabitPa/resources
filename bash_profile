. ~/.alias

# colourfull
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# Add Tab-completion for SSH host aliases
complete -o default -o nospace -W "$(awk '/^Host / {print $2}' < $HOME/.ssh/config)" scp sftp ssh

# Terminal title
function _update_ps1() {
   export PS1="$(~/MyProjects/github/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'

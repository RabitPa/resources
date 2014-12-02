. ~/.alias

# terminal color setting
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# Add Tab-completion for SSH host aliases
complete -o default -o nospace -W "$(awk '/^Host / {print $2}' < $HOME/.ssh/config)" scp sftp ssh

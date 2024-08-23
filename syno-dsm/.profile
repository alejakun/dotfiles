
#export TERM=screen-256color

#export USR_PATH=/volume1/docker/shared/scripts
#export PATH=$USR_PATH/docker:$USR_PATH/system:${PATH}

if [[ -x /usr/local/bin/zsh ]]; then
  export SHELL=/usr/local/bin/zsh
  exec /usr/local/bin/zsh
fi

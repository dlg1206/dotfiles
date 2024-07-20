#!/bin/bash

# File: setup
# Description:
#
# @author: Derek Garcia
    
# Define env variables
export DOTFILE_REPO=https://github.com/dlg1206/dotfiles

DOTFILES=('gitconfig')



main(){

  # use args if given, default all
  if [ -z "$@" ]; then
    dotfiles=("${DOTFILES[@]}")
  else
    dotfiles=("$@")
  fi

  # iterate through all configs and setup
  for config in "${dotfiles[@]}"
  do
    case $config in
      # git
      gitconfig)
        echo "config"
        ;;

      # unknown config
      *)
        echo "warn"
        ;;
    esac
  done
}


main "$@"
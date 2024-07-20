#!/bin/bash

# File: setup
# Description:
#
# @author: Derek Garcia
    

# supported configs
DOTFILES=('gitconfig')

# Iterate through configs and set them up
#
# return: 0 if OS is known, 1 otherwise
__set_os(){
  case "$OSTYPE" in
    solaris*) export OS="SOLARIS" ;;
    darwin*)  export OS="OSX" ;;
    linux*)   export OS="LINUX" ;;
    bsd*)     export OS="BSD" ;;
    msys*)    export OS="WINDOWS" ;;
    *)
      echo "Unknown OS '$OSTYPE'" >&2
      exit 1
      ;;
  esac
  return 0
}


# Iterate through configs and set them up
#
# @param $@: array of configs to setup
main(){
  # set os, err if unknown
  __set_os || exit 1

  # use args if given, default all
  if [ -z "$*" ]; then
    dotfiles=("${DOTFILES[@]}")
  else
    # todo rm dup
    dotfiles=("$@")
  fi

  # iterate through all configs and setup
  for config in "${dotfiles[@]}"
  do
    case $config in
      # git
      gitconfig)
        . git/setup.sh
        ;;

      # unknown config
      *)
        echo "Unknown config '$config'" >&2
        ;;
    esac
  done
  exit 0
}


main "$@"
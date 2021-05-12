#!/bin/bash

VIM_DIRECTORY="$HOME/.vim"

function _install_if_needed {
  if [ command -v $1 &> /dev/null ]
  then
    echo "$1 isn't installed. Install."
    sudo apt-get install $1 -y
  fi
  echo "$1 is installed. Continue."
}

# Reading arguents and set up script.
while test $# -gt 0
do
  if [ -n "$1" ]
  then
    case "$1" in
      --directory | -d )
        VIM_DIRECTORY=$2
        shift;;
      * )
        echo "Unexpected argument \"$1\". Abort."
        exit 1;;
    esac
  fi
  shift
done

sudo apt-get update -y
_install_if_needed "git"
_install_if_needed "cscope"

echo "Start installation into directory \"$VIM_DIRECTORY\""

# Create vim directory if not exist.
if [ ! -d "$VIM_DIRECTORY" ]; then
  echo "Directory is not exist. Create."
  mkdir $VIM_DIRECTORY
fi

# Copying .vimrc.
cp vimrc $VIM_DIRECTORY/vimrc
# Copying cscope mappins.
cp plugin/cscope_maps.vim $VIM_DIRECTORY/plugins

# Moving into installation directory
cd $VIM_DIRECTORY

echo "Installation finished."

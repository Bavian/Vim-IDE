#!/bin/bash

VIM_DIRECTORY="$HOME/.vim"
SWAP_DIRECTORY=".swap"
CHROMIUM_VIM_DIRECTORY="chromium-vim"
MOJOM_VIM_PATH="mojom/syntax/mojom.vim"
KOTLIN_VIM_REPO="https://github.com/udalov/kotlin-vim.git"
VIM_GO_REPO="https://github.com/fatih/vim-go.git"

function _install_if_needed {
  echo "Install $1..."
  sudo apt-get install $1 -y &> /dev/null
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

# Install required packages
sudo apt-get update -y
_install_if_needed "vim"
_install_if_needed "git"
_install_if_needed "cscope"
_install_if_needed "wget"

echo "Start installation into directory \"$VIM_DIRECTORY\""

# Create vim directory if not exist.
if [ ! -d "$VIM_DIRECTORY" ]; then
  echo "Directory is not exist. Create."
  mkdir $VIM_DIRECTORY
fi

# Copying .vimrc.
cp vimrc $VIM_DIRECTORY/vimrc

# Copying cscope mappins.
if [ ! -d $VIM_DIRECTORY/plugin ]
then
  mdkir $VIM_DIRECTORY/plugin
fi

echo "Download cscope mappings..."
wget -P $VIM_DIRECTORY/plugin http://cscope.sourceforge.net/cscope_maps.vim

# Install "kotlin_vim".
echo "Install kotlin-vim"
if [ -d $VIM_DIRECTORY/pack/plugins/start/kotlin-vim ]
then
  echo "Kotlin-vim is already installed, updating repository..."
  git --git-dir $VIM_DIRECTORY/pack/plugins/start/kotlin-vim/.git fetch &&\
  git --git-dir $VIM_DIRECTORY/pack/plugins/start/kotlin-vim/.git pull
else
  echo "Cloning repository..."
  git clone $KOTLIN_VIM_REPO $VIM_DIRECTORY/pack/plugins/start/kotlin-vim
fi

# Install "Vim GO"
# TODO: Do something with :GoInstallBinaries(vim -c opens vim)
echo "Install vim-go"
if [ -d $VIM_DIRECTORY/pack/plugins/start/vim-go ]
then
  echo "Vim-go is already installed, updating repository..."
  git --git-dir $VIM_DIRECTORY/pack/plugins/start/vim-go/.git fetch &&\
  git --git-dir $VIM_DIRECTORY/pack/plugins/start/vim-go/.git pull
else
  echo "Cloning vim-go"
  git clone $VIM_GO_REPO $VIM_DIRECTORY/pack/plugins/start/vim-go
fi

echo "Download mojom highlighting..."
mkdir $SWAP_DIRECTORY
git clone https://chromium.googlesource.com/chromium/src/tools/vim/ $SWAP_DIRECTORY/$CHROMIUM_VIM_DIRECTORY
cp $SWAP_DIRECTORY/$CHROMIUM_VIM_DIRECTORY/$MOJOM_VIM_PATH $VIM_DIRECTORY/plugin
rm -fr $SWAP_DIRECTORY

echo "Installation finished."

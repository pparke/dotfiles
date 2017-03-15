#!/bin/bash
#######################################
# setup.sh
# This script creates symlinks to the 
# dotfile contained in the dotfiles 
# directory
#######################################

# Variables
DOTDIR=$HOME/dotfiles
OLDDIR=$HOME/dotfiles_old
declare -A DOT_FILES=( [init.vim]=$HOME/.config/nvim [.tmux.conf]=$HOME )

# Create a folder to hold the existing
# dotfiles that were on the system
echo "Creating $OLDDIR for backup of any existing dotfiles"
mkdir -p $OLDDIR
echo "...done"

# Change to the dotfiles directory
echo "Changing to the $DOTDIR directory"
cd $DOTDIR
echo "...done"

# Move the existing dotfiles to the
# backup location
for FILE in "${!DOT_FILES[@]}"; do
  FILE_PATH="${DOT_FILES[$FILE]}"
	FULL_PATH="$FILE_PATH/$FILE"
	# only backup the file if it exists
	if [ -f $FULL_PATH ]; then
		echo "Moving $FULL_PATH to $OLDDIR"
		mv $FULL_PATH $OLDDIR
	fi
	# make sure the directory exists before we put a link in it
	if [ ! -d $FILE_PATH ]; then
		mkdir -p $FILE_PATH
	fi
  echo "Creating symlink from $DOTDIR/$FILE to $FULL_PATH"
  ln -s $DOTDIR/$FILE $FULL_PATH 
done

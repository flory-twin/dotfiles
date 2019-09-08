# This script is meant to be used after a fresh install.  
# It will append the contents of the 'local' dotfiles to the dotfiles stored in Git, then replace the local dotfiles with symlinks.

# ASSUMES THAT USER IS IN CHECKED-OUT GIT .dotfiles DIRECTORY!

# WILL NOT HANDLE DOTFILES IN SUBDIRECTORIES OF .dotfiles.
# Before anything else, verify that this script is not being run in the home directory.  If it is, don't attempt to continue.
if [ "$HOME/.dotfiles" != "$(pwd)" ]
then 
  echo 'Please use this script by first checking out the parent repo to ~.dotfiles, and run the script from there.';
  exit -1;
fi

## For each directory in the current directory, their descendants, and for this directory:
#
## FIrst, set up how to get directories...
#function 
#declare -a DIRECTORIES
#DIRECTORIES = 

# For each dotfile starting with . (that is, identified by the .* glob):
for DOTFILE in $(find .*)
  do
  if [ -f ~/$DOTFILE ]
  then
    echo "Appending ~/$DOTFILE to $DOTFILE";
    # Combine the system version and the repository version.
    ## Pull the contents from the current system version of the dotfile, in $HOME.  Take only those contents in the system version, but not in the repo version.  Then append the system-unique stuff to the downloaded (repository) version.
    echo "" >> $DOTFILE
    echo "# Additional Stuff from System $DOTFILE" >> $DOTFILE
    echo "" >> $DOTFILE
    
    ## Implementation note: for some reason, I can't get \d to be recognized by my Sed call...so I've specified the full numeric class instead of \d.
    diff ~/$DOTFILE $DOTFILE | sed '/^>.*/d' | sed '/.*---.*/d' | sed '/^[0123456789]/d' | sed -n 's/^< \(.*\)$/\1/p' >> $DOTFILE

    # Now replace the system version with the repository version.
    ## delete the system file.
    rm -f ~/$DOTFILE
  fi

   ## Regardless of whether the original file existed in the system, create a symlink from the local repo copy to the home directory.
  {
    cd ~ 
    pwd
    ln -s ~/.dotfiles/$DOTFILE $DOTFILE
  } 
done

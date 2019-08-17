# This script is meant to be used after a fresh install.  It will append the contents of the 'local' dotfiles to the dotfiles stored in Git, then replace the local dotfiles with symlinks.
# ASSUMES THAT USER IS IN CHECKED-OUT GIT .dotfiles DIRECTORY!
HOMEDIR=$HOME
CURRENTDIR=$(pwd)

# Before anything else, verify that this script is not being run in the home directory.  If it is, don't attempt to continue.
if [ "$HOME" = "$(pwd)" ]
then 
  echo 'This script was executed in the home directory.';
  echo 'Please use this script by first checking out in a directory other than home, such as .dotfiles, and run the script from there.';
  exit -1;
fi

# For each dotfile starting with .bash:
for DOTFILE in $(find .bash*)
  do
  if [ -f ~/$DOTFILE ]
  then
    echo "Appending ~/$DOTFILE to $DOTFILE";
    # Pull the contents from the current system .bash*.  Then append them to the one stored under this repository (local copy, of course).
    echo "" >> $DOTFILE
    echo "# Additional Stuff from System $DOTFILE" >> $DOTFILE
    echo "" >> $DOTFILE
 
    diff ~/$DOTFILE $DOTFILE | sed '/^>.*/d' | sed '/.*---.*/d' | sed '/^[0123456789]/d' | sed -n 's/^< \(.*\)$/\1/p' >> $DOTFILE

    # Now delete the system file.
    rm -f ~/$DOTFILE
  fi

  # Regardless of whether the original file existed in the system, create a symlink from there to here.
  {
    cd ~ 
    pwd
    ln -s ~/.dotfiles/$DOTFILE $DOTFILE
  } 
done



#.bash_profile, executed by login shells.  

# Add the system github key to the ssh keyring, assuming such a key exists in the standard location...
if [ -f ~/.ssh/id_rsa ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
fi

# If .bashrc exists, append it to this file.
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

    sudo apt-get update

    sudo apt-get dist-upgrade

    sudo apt-get install git-core

    sudo apt-get install zsh

    ssh-keygen

    cat ~/.ssh/id_rsa.pub 
    
[Account](https://github.com/account/)
    
    git clone git@github.com:dolzenko/dotfiles.git dotfiles_clone_tmp
    
    mv dotfiles_clone_tmp/.git/ $HOME/dotfiles.git
     
    cp -v -b -r dotfiles_clone_tmp/.* $HOME  # carefull with BSD as it can't make backups

    cp -v -b -r dotfiles_clone_tmp/* $HOME 
    
    chsh -s /bin/zsh `whoami`
    
    ^D
    
    git_dotfiles status

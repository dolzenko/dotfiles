    <.ssh/*.pub[TAB]
    
    [Account](https://github.com/account/)
    
    git clone git@github.com:dolzenko/dotfiles.git dotfiles_clone_tmp
    
    mv dotfiles_clone_tmp/.git/ $HOME/dotfiles.git
     
    cp -v -b -r dotfiles_clone_tmp/.* $HOME

    cp -v -b -r dotfiles_clone_tmp/* $HOME 
    
    ^D
    
    git_dotfiles status
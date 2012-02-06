if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
if [ -d ~/git/bin ] ; then
    PATH=~/git/bin:"${PATH}"
fi
export ACK_COLOR_FILENAME="red on_white"
export ACK_COLOR_FILENAME="red on_white"
export LESSHISTFILE=- # Name of the history file used to remember search commands and shell commands between invocations of less. If set to "-" a history file is not used.
export EDITOR='vi'
export VISUAL='vi'

LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY # multiple shells append to history files, new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell is killed
setopt AUTO_CD # cd to dir by entering only dir name
setopt EXTENDED_GLOB # If the EXTENDED_GLOB option is set, the `^' and `#' characters also denote a pattern
setopt HIST_IGNORE_DUPS # Do not enter command lines into the history list if they are duplicates of the previous event
setopt COMPLETE_IN_WORD # If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.
setopt extended_glob # dot files in globs and other
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells.

bindkey -e # Selects keymap `emacs'
# bindkey -m # meta sends escape

autoload -Uz compinit
compinit

# no spelling correction
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

setenv() { export $1=$2 }  # csh compatibility

autoload -U promptinit 
promptinit
prompt suse # should look like: root@freebsd71:/usr/local/lib/ >

setopt AUTO_PUSHD # Make cd push the old directory onto the directory stack.
export DIRSTACKSIZE=64 # The maximum size of the directory stack. If the stack gets larger than this, it will be truncated automatically.
setopt PUSHD_SILENT # Do not print the directory stack after pushd or popd.

# misc aliases
alias -g .....='../../../..'
alias -g ....='../../..'
alias -g ...='../..'
alias ..='cd ..'
alias a='cat ~/.zshrc | grep alias | sort'
alias c='clear'
alias cd..='cd ..'
alias d="date '+%Y-%m-%d %H:%M'"
alias df="df -h"
alias du="du -h"
alias f="find . -path '*.svn*' -prune -o -print | grep"
alias gh='cat ~/.zsh_history | grep'
alias j=jobs
alias l='LC_COLLATE=C ls --color -a -l -A --group-directories-first -F -h --time-style=long-iso'
alias lad='ls -d .*(/)'                # only show dot-directories
alias lsa='ls -a .*(.)'                # only show dot-files
alias lsbig="ls -flh *(.OL[1,10])"     # display the biggest files
alias lsd='ls -d *(/)'                 # only show directories
alias lsd='ls -ld *(-/DN)' # list directories
alias lse='ls -d *(/^F)'               # only show empty directories
alias lsl='ls -l *(@[1,10])'           # only symlinks
alias lsnew="ls -rl *(D.om[1,10])"     # display the newest files
alias lsold="ls -rtlh *(D.om[1,10])"   # display the oldest files
alias lss='ls -l *(s,S,t)'             # only files with setgid/setuid/sticky flag
alias lssmall="ls -Srl *(.oL[1,10])"   # display the smallest files
alias lsw='ls -ld *(R,W,X.^ND/)'       # world-{readable,writable,executable} files
alias lsx='ls -l *(*[1,10])'           # only executables
alias p='ps axu'
alias po='popd'
alias pu='pushd'
alias t='tail'
alias u="tar xzfv"
alias v='vi'
alias zshrc='vi ~/.zshrc && source ~/.zshrc'
alias dh='dirs -v'
alias h='fc -f -l -32 -1' # last 32 commands from history with timestamps
alias chmodrd="find . -type d -exec chmod 755 {} \;"
alias chmodrf="find . -type f -exec chmod 644 {} \;"
alias x='extract'
alias i='irb'
alias r='rake --trace'
alias s='rspec'
alias model="rails generate model"
alias controller="rails generate controller"
alias migration="rails generate migration"
alias destroy="rails destroy"
alias truncate_logs=": > log/*log"
#alias rs='rails server'
#alias rc='rails console'
# launching console/server
# console
function rc() {
  if [ -x script/rails ]; then
    script/rails console
  elif [ -x script/console ]; then
    script/console
  else
    echo "no script/rails or script/console found" >&2
  fi
}

# server
function rs() {
  if [ -x script/rails ]; then
    script/rails server
  elif [ -x script/server ]; then
    script/server
  else
    echo "no script/rails or script/server found" >&2
  fi
}

alias -g G='|grep'
alias -g H='|head'
alias -g L='|less'
alias -g ND='$(ls -d *(/om[1]))' # newest directory
alias -g NF='$(ls *(.om[1]))'    # newest file
alias -g S='sudo'
alias -g T='|tail'
alias sudo='command sudo ' # That will cause zsh to expand your command aliases after a "sudo" command. (http://www.zsh.org/mla/users/2003/msg00411.html)
alias fm='free -m'


# Produces something like:
#  ---- external command
#  cdctrl            cddbsubmit        cdparanoia        cdrecord
#  ---- builtin command
#  cd
#  ---- shell function
#  cdmatch                 cdmatch.newer           cdswap
zstyle ':completion:*:descriptions' format "---- %d"
zstyle ':completion:*:messages' format "---- %d"
zstyle ':completion:*:warnings' format "---- no match"
zstyle ':completion:*' group-name ''


# With predict-on in effect, the line editor will try to retrieve a line back in the history which matches what you type. 
# If it does, it will show the line, extending past the current cursor position.
autoload -U incremental-complete-word predict-on
zle -N incremental-complete-word
zle -N predict-on
zle -N predict-off
bindkey '^Xi' incremental-complete-word
bindkey '^Xp' predict-on
bindkey '^X^P' predict-off


# If verbose is true, the function generating the matches may, at its discretion, decide to show more information about them. The most common case is when describing options; 
zstyle ':completion:*' verbose yes

# If an ambiguous completion produces at least 2 possibilities, menu selection is started
zstyle ':completion:*' menu select=2 

# from http://dotfiles.org/~frogb/.zshrc
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' expand 'yes'

zstyle ':completion:*:matches' group 'yes'

zstyle ':completion:history-words:*:history-words' stop yes
zstyle ':completion:history-words:*' remove-all-dups yes


ZDOTDIR_OR_HOME=${ZDOTDIR:-$HOME}


source ${ZDOTDIR:-$HOME}/.machine.myloc
addloc()
{
	echo "$1=`pwd`\n" >> ~/.machine.myloc
	source ~/.machine.myloc
}


# http://www.zsh.org/mla/users/2006/msg01148.html
DIRSTACKSIZE=20
if [[ -f ~/.zdirs ]] && [[ ${#dirstack[*]} -eq 0 ]]; then
    dirstack=( ${(uf)"$(< ~/.zdirs)"} )
fi
chpwd() { dirs -pl >! ~/.zdirs }


# http://dotfiles.org/~algorithm/.zshrc
# Reset current directory to sensible permissions
saneperms() 
{
	find . -type d -print0 | xargs -0 chmod 755
	find . -type f -print0 | xargs -0 chmod 644
}

extract() {
   if [[ -z "$1" ]] ; then
       print -P "usage: extract < filename >"
       print -P "       Extract the file specified based on the extension"
   elif [[ -f $1 ]] ; then
       case ${(L)1} in
           *.tar.bz2)  tar -jxvf $1     ;;
           *.tar.gz)   tar -zxvf $1     ;;
           *.bz2)      bunzip2 $1          ;;
           *.gz)       gunzip $1           ;;
           *.jar)      unzip $1       ;;
           *.rar)      unrar x $1          ;;
           *.tar)      tar -xvf $1         ;;
           *.tbz2)     tar -jxvf $1     ;;
           *.tgz)      tar -zxvf $1     ;;
           *.zip)      unzip $1       ;;
           *.Z)        uncompress $1    ;;
           *)          echo "Unable to extract '$1' :: Unknown extension"
       esac
   else
       echo "File ('$1') does not exist!"
   fi
}

# simple password generator (first parameter - the length, default - 8 chars)
generate_password()
{
echo `< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-8}`
}



# format titles for screen and rxvt
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\"      # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2 | $a:$3\a" # plain xterm title
    ;;
  esac
}
# precmd is called just before the prompt is printed
function precmd() {
  title "zsh" "$USER@%m" "%55<...<%~"
}

# preexec is called just before any command line is executed
function preexec() {
  title "$1" "$USER@%m" "%35<...<%~"
}

# Git dotfiles
export GIT_DOTFILES='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
alias git_dotfiles=$GIT_DOTFILES
# alias git_dotfiles_push='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME commit -a && git --git-dir=$HOME/dotfiles.git --work-tree=$HOME push'
alias git_dotfiles_acp=git_dotfiles add -i && git_dotfiles commit -m "Minor" && git_dotfiles push
zsh ${ZDOTDIR:-$HOME}/bin/git_dotfiles_check &

export RUBYOPT="-rubygems" 

# trigger specific to my own setting behaviour in scripts and application
export DOLZENKO=1

# http://stackoverflow.com/questions/890620/unable-to-have-bash-like-c-x-e-in-zsh
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# develop out of the current directory
# courtesy rtomayko http://gist.github.com/361451#gistcomment-948
rbdev() {
    local useful dir
    test -d ./bin && {
        useful=yes
        PATH="$(pwd)/bin:$PATH"
        echo "./bin on \$PATH"
    }
    test -d ./ext && {
        useful=yes
        for dir in ./ext/*
        do
            test -d "$dir" || continue
            RUBYLIB="$(pwd)/$dir:$RUBYLIB"
            export RUBYLIB
            echo "$dir on \$RUBYLIB"
        done
    }
    test -d ./lib && {
        useful=yes
        RUBYLIB="$(pwd)/lib:$RUBYLIB"
        export RUBYLIB
        echo "./lib on \$RUBYLIB"
    }
    test -z "$useful" && {
        echo "no ./lib or ./bin detected. help me help you."
        return 1
    }
}
# http://stevehodgkiss.com/blog/2010/01/27/speed-up-your-git-workflow-with-bash-aliases/
alias gl='git pull --rebase'
alias gp='git push'
alias gpom='git push origin master'
alias gd='git diff --ignore-space-change'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch -a'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gai="git add -i"
alias gg='git log'
alias go='git show'
alias grh='git reset --hard HEAD'

# http://brett.benders.net/2008/07/25/zsh-wordchars/
# At the shell prompt, I want to directories in a path to act like words, so that I can kill them one by one.
WORDCHARS="${WORDCHARS:s#/#}" # takes the value of WORDCHARS, removes slash, and assigns back to WORDCHARS

# http://superuser.com/questions/2127/what-zsh-features-do-you-use
# On an empty command line runs bg (so that Ctrl+Z Ctrl+Z suspends a program and immediately resumes it in the background).
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    bg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Heroku aliases from http://robots.thoughtbot.com/post/13751185765/i-learned-to-alias-shell-commands-with-hooked-on
# Heroku beta
alias beta='heroku run console --remote beta'
alias beta-process='watch heroku ps --remote beta'
alias beta-releases='heroku releases --remote beta'
alias beta-tail='heroku logs --tail --remote beta'

# Heroku production
alias production='heroku run console --remote production'
alias production-process='watch bundle exec heroku ps --remote production'
alias production-releases='heroku releases --remote production'
alias production-tail='heroku logs --tail --remote production'

# Heroku databases
alias db-pull-beta='heroku db:pull --remote beta --confirm `basename $PWD`-beta'
alias db-pull-production='heroku db:pull --remote production --confirm `basename $PWD`-production'
alias db-copy-production-to-beta='heroku pgbackups:restore DATABASE `heroku pgbackups:url --remote production` --remote beta  --confirm `basename $PWD`-beta'
alias db-backup-production='heroku pgbackups:capture --remote production'
alias db-backups='heroku pgbackups --remote production'

# Machine specific .zshrc
[[ -f ${ZDOTDIR:-$HOME}/.machine.zshrc ]] && source ${ZDOTDIR:-$HOME}/.machine.zshrc

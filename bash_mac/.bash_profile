# Setting for the NJ/ML compiler for ML --> Programming Languages
export PATH="$PATH:/usr/local/smlnj/bin"

# Setting for the HASKELL symlink
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Setting for the Haskell executables built by the stack tool
export PATH="$HOME/.local/bin:$PATH"

# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
if [ -d "$GHC_DOT_APP" ]; then
	  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
  fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# added by Anaconda 1.9.2 installer
export PATH="/Users/jus/anaconda/bin:$PATH"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# The next line enables bash completion for gcloud.
source '/Users/Jus/CS-410-Group-Project/google-cloud-sdk/completion.bash.inc'

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# added by Anaconda3 2.0.1 installer
export PATH="/Users/Jus/Desktop/anaconda/bin:$PATH"

# For the RVM (Ruby)
source /Users/Jus/.rvm/scripts/rvm

# export PS1="___________________    | \w @ \h (\u) \n| => "
# export PS2="| => "

#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit: Opens any file in sublime editor
alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:Go Home
alias c='clear'                             # c: Clear terminal display
alias which='type -all'                     # which: Find executables
alias path='echo -e ${PATH//:/\\n}'         # path: Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty: Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic: Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash: Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql: Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT: Pipe content to file on MacOS Desktop

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# OPAM configuration
. /Users/Jus/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

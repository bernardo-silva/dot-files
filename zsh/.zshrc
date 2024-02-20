# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/bernardo-silva/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
        zsh-autosuggestions
        zsh-syntax-highlighting
        colored-man-pages
        vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration
setopt autocd extendedglob
unsetopt beep
bindkey -e


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.config"

# Clean Home Dir -----------
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter


# export SSB_HOME="$XDG_DATA_HOME/zoom"
# export MATHEMATICA_USERBASE="$XDG_CONFIG_HOME/mathematica"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
# export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
# export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk2.0/gtkrc"
# export LESSHISTFILE="-"
# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
 

local nvidiadir=~/.config/nvidia/settings
alias nvidia-settings="nvidia-settings --config=$nvidiadir"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/bernardo-silva/go/bin"
export PATH="$PATH:/home/bernardo-silva/flutter/bin"
# export PATH="$HOME/.npm-global/bin:$PATH"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR=nvim

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export GUROBI_HOME="/home/bernardo-silva/gurobi1001/linux64" 
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
function o {
   if [ "$#" = 0 ]; then
       file=$(fzf --height 40%)
      xdg-open $file & disown
      return
    fi

   xdg-open "$1" & disown
}

export CHROME_EXECUTABLE=/var/lib/flatpak/app/com.google.Chrome/x86_64/stable/active/export/bin/com.google.Chrome


# User functions

function mcdir ()
{
     mkdir -p -- "$1" &&
           cd -P -- "$1"
}

function sem {
        cd ~/Nextcloud/5_ano/1_semestre/"$1"
}
alias semestre=sem
function mt {
        cd ~/Nextcloud/5_ano/thesis/"$1"
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias i3config='nvim ~/.config/i3/config'

alias lh='ls -lh'
alias 'ls -l'='ls -lh'

alias coqide='GTK_THEME=Adwaita coqide'

alias pypy='pypy3'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gst='git status'
alias gco='git checkout'
alias gcom='git checkout main'
alias py='python3'
alias python='python3'
alias pypy='pypy3'

function pdfcompress ()
{
    if [ "$#" = 0 ]; then
        echo "pdfcompress quality(screen, ebook, printer) in.pdf out.pdf"
        return
    fi
    echo "$3"
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/"$1" –sOutputFile="$3" "$2"
}

function pdftosvg ()
{
    if [ "$#" = 0 ]; then
        echo "pdftosvg file.pdf"
        return
    fi
    inkscape --pdf-poppler "$1" --export-type="svg"
}


function br (){
    local reverse=false
    if [ $1 = "-r" ]; then
        reverse=true
        shift
    fi

    local file_list=($2/*.in)

    if [ "$reverse" = true ]; then
        file_list=($(ls -r $2/*.in))
    fi

    for file in "${file_list[@]}"
    do
        out="${file%.*}.out"
        echo $out
        pypy $1 < $file | tee "${out}"
        echo
    done
}


. /usr/share/autojump/autojump.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

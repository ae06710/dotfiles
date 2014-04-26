#
# Load Environment variable
#

# Boxen
source /opt/boxen/env.sh

## color definition
#
local DEFAULT=$'%{^[[m%}'$
local RED=$'%{^[[1;31m%}'$
local GREEN=$'%{^[[1;32m%}'$
local YELLOW=$'%{^[[1;33m%}'$
local BLUE=$'%{^[[1;34m%}'$
local PURPLE=$'%{^[[1;35m%}'$
local LIGHT_BLUE=$'%{^[[1;36m%}'$
local WHITE=$'%{^[[1;37m%}'$

## LANG
#
export LANG=ja_JP.UTF-8

## antigen
#
source $HOME/dotfiles/.zsh/.zshrc.antigen

## Default shell configuration
#
# set prompt
#
source $HOME/dotfiles/.zsh/.zshrc.prompt

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# Keybind configuration
bindkey -v


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


#
# Completion
#

# zsh-completions( have to write compinit before )
fpath=($HOME/dotfiles/.zsh/zsh-completions/src $fpath)

autoload -U compinit; compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                               /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                               /usr/local/git/bin

# hilight selected option
zstyle ':completion:*:default' menu select=2

# grouping options
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''


# coloring
case "${OSTYPE}" in
  freebsd*|darwin*)
    if [ -f $HOME/dotfiles/.zsh/.zshrc.mac ]; then
      source $HOME/dotfiles/.zsh/.zshrc.mac
    fi
    ;;
  linux*)
    if [ -f $HOME/dotfiles/.zshrc.linux ]; then
      source $HOME/dotfiles/.zshrc.linux
    fi
  ;;
esac
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload colors; colors


# command
setopt auto_param_slash # add autometicaly "/", when comple directory name
setopt mark_dirs # add autometicaly "/", deploying dir
setopt list_types # add file type mark like `ls -F`
setopt interactive_comments # In command line cognition "#" as comment


#
# develop
#
source ~/dotfiles/.zsh/.zshrc.alias
source ~/dotfiles/.zsh/.zshrc.language

# git
export GIT_EDITOR="/usr/bin/vim"

# z
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

# redis for hubot
export REDISTOGO_URL=$BOXEN_REDIS_URL

# Action Script
export PATH=$PATH:/Applications/flex_sdk_4.6/bin


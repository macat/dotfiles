# ===================================================================
# Load any user customizations prior to load
#
if [ -d $HOME/.zsh.before/ ]; then
  if [ "$(ls -A $HOME/.zsh.before/)" ]; then
    for config_file ($HOME/.zsh.before/*.zsh) source $config_file
  fi
fi

# ===================================================================
# path, the 0 in the filename causes this to load first
export PATH=$PATH:$HOME/.dotfiles/bin:$HOME/.dotfiles/bin/dotfiles

# =============
#    ALIAS
# =============
alias ..='cd ..'

alias t="tig status"
alias tigs="tig status" #old habits don't die
alias d='git diff' 

# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias ls='ls -Gh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias lsg='ll | grep'

case `uname` in
  Darwin)
    alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed'
    alias ls='ls -GpF' # Mac OSX specific
    alias ll='ls -alGpF' # Mac OSX specific
  ;;
  Linux)
    alias ll='ls -al'
    alias ls='ls --color=auto' 
  ;;
esac

alias sq='git rebase -i $(git merge-base $(git rev-parse --abbrev-ref HEAD) $(basename $(git symbolic-ref refs/remotes/origin/HEAD)))'

# if it fails to resolve, set the HEAD with: git remote set-head origin --auto
alias co='git checkout $(basename $(git symbolic-ref refs/remotes/origin/HEAD))'
alias po='git pull origin $(git rev-parse --abbrev-ref HEAD)'

# cd into git root dir
alias cdr='cd $(git rev-parse --show-toplevel)'

# show 
alias duh='du -sh -h * .[^.]* 2> /dev/null | sort -h'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsh='git show'
alias gi='vim .gitignore'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias lh='ls -alt | head' # see the last modified files
alias cl='clear'

alias vi='nvim'
alias vim='nvim'

# ===================================================================
# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'
# ===================================================================
# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'
# ===================================================================
# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something


export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# =============
#    EXPORT
# =============

export EDITOR=nvim
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

setopt PUSHDSILENT

# =============
#    HISTORY
# =============

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups 
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history 

# =============
#    PROMPT
# =============
autoload -U colors && colors
setopt promptsubst

local ret_status="%(?:%{$fg_bold[green]%}$:%{$fg_bold[green]%}$)"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get customzsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')

  if [[ "$(command git config --get customzsh.hide-dirty)" != "1" ]]; then
    FLAGS+='--ignore-submodules=dirty'
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# ===================
#    KEY BINDINGS
# ===================
# Use emacs-like key bindings by default:
bindkey -e

# ===================================================================
# Load any custom after code
if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi
# ===================================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

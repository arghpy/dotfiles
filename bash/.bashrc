# Options
set -o vi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# get current branch in git repo
function parse_git_branch() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ ! "${BRANCH}" == "" ]
  then
    echo " [${BRANCH}]"
  else
    echo ""
  fi
}

# Aliases
alias ls='ls --color=auto'       # ls with colors
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

# Exports
export PS1='\u@\H: \W\[\e[92m\]$(parse_git_branch)\[\e[0m\] \$ '
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/opt/bin"
export EDITOR="vim"

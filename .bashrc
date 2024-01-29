alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\033[A":history-search-backward'
bind '"\033[B":history-search-forward'

export EDITOR="vim"

set -o vi

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

export PS1='\u@\H \w\[\e[92m\]$(parse_git_branch)\[\e[0m\] \$ '
export PATH="${PATH}:~/.local/bin/custom"

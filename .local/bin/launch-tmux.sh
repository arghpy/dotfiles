#!/usr/bin/env bash
# GitHub
GITHUB_REPOS_DIR="/home/arghpy/stuff/github"
GITHUB_REPOS="$(ls -d "${GITHUB_REPOS_DIR}/"* | sort)"
FIRST_GIT_REPO_PATH="$(echo "${GITHUB_REPOS}" | head -1)"
FIRST_GIT_REPO_NAME="$(basename ${FIRST_GIT_REPO_PATH})"

tmux new-session -s GitHub -d -n "${FIRST_GIT_REPO_NAME}"
tmux send-keys -t "GitHub:0" "cd ${FIRST_GIT_REPO_PATH}" Enter

REPO_COUNTER=1

for repo in $(echo "${GITHUB_REPOS}" | tail -n +2); do
  tmux new-window -n "$(basename ${repo})" -t "GitHub:${REPO_COUNTER}"
  tmux send-keys -t "GitHub:${REPO_COUNTER}" "cd ${repo}" Enter
  ((REPO_COUNTER += 1))
done

# SSH
tmux new-session -s SSH -d -n "server1"
tmux send-keys -t "SSH:0" "ssh server1" Enter

tmux new-window -n "server2" -t "SSH:1"
tmux send-keys -t "SSH:1" "ssh server2" Enter

# Other
tmux new-session -s Other -d

# Final
tmux attach-session

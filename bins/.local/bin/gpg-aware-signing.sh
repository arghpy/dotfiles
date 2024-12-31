#!/usr/bin/env bash

if [ -n "$DISPLAY" ]; then
  exec gpg2 "$@"
else
  exec gpg2 --pinentry-mode loopback "$@"
fi

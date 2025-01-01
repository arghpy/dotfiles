#!/usr/bin/env bash

exec gpg2 --pinentry-mode loopback "$@"

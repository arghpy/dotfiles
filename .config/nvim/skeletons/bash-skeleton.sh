#!/usr/bin/env bash

usage() {
  cat << EOF

Usage: ./$(basename "${0}") [OPTIONS] [FILE]

DESCRIPTION:


OPTIONS:
-a, --aaa
-b, --bbb
-c, --ccc
-d, --ddd
EOF
}

if [[ $# -eq 0 ]]; then
  echo "No option provided."
  usage
  exit 1
fi

# Gather options
while [[ ! $# -eq 0 ]]; do
  case "${1}" in
    -h | --help)
      usage
      exit 0
      ;;

    -a | --aaa)
      if [[ -z "${2-}" || ! -e "${2}" ]]; then
        usage
        exit 1
      fi
      shift
      # shellcheck disable=SC2034
      A_ARGUMENT="${1}"
      ;;

    -b | --bbb)
      if [[ -z "${2-}" || ! -e "${2}" ]]; then
        usage
        exit 1
      fi
      shift
      # shellcheck disable=SC2034
      B_ARGUMENT="${1}"
      ;;

    -c | --ccc)
      if [[ -z "${2-}" || ! -e "${2}" ]]; then
        usage
        exit 1
      fi
      shift
      # shellcheck disable=SC2034
      C_ARGUMENT="${1}"
      ;;

    -d | --ddd)
      if [[ -z "${2-}" || ! -e "${2}" ]]; then
        usage
        exit 1
      fi
      shift
      # shellcheck disable=SC2034
      D_ARGUMENT="${1}"
      ;;

    *)
      echo "Invalid option: ${1}"
      usage
      exit 1
      ;;
  esac
  shift
done

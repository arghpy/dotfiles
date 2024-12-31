#!/usr/bin/env bash

# shellcheck disable=SC1090
if ! source ~/.local/bin/log_functions.sh; then
  echo "Could not source log_functions"
  exit 1
fi

usage() {
  cat <<EOF

Usage: ./$(basename "${0}") [OPTIONS]

DESCRIPTION:
  Watch directory for torrents and move them
  on the target host, in specified directory

OPTIONS:
  -w, --watch-dir
    Directory to be watched for torrents

  -t, --target-host
    Target host to move torrent to

  -d, --dest-dir
    Destination directory for the torrent
EOF
}

if [[ $# -lt 6 ]]; then
  log_error "Too few options and arguments provided"
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

  -w | --watch-dir)
    if [[ -n "${2}" ]]; then
      shift
      # shellcheck disable=SC2034
      WATCH_DIRECTORY="$(realpath "${1}")"

      if [[ ! -d "${WATCH_DIRECTORY}" ]]; then
        log_error "Directory ${WATCH_DIRECTORY} does not exist"
        usage
        exit 1
      fi
    else
      log_error "You need to provide an argument for -w, --watch-dir"
      usage
      exit 1
    fi
    ;;

  -t | --target-host)
    if [[ -n "${2}" ]]; then
      if ! ping -c1 -w1 "${2}" >&/dev/null; then
        log_error "Address ${2} is unreachable"
        usage
        exit 1
      else
        shift
        # shellcheck disable=SC2034
        TARGET_HOST="${1}"
      fi
    else
      log_error "You need to provide an argument for -t, --target-host"
      usage
      exit 1
    fi
    ;;

  -d | --dest-dir)
    if [[ -z "${2}" ]]; then
      log_error "You need to provide an argument for -d, --dest-dir"
      usage
      exit 1
    fi
    shift
    # shellcheck disable=SC2034
    DEST_DIRECTORY="${1}"
    ;;

  *)
    log_error "Invalid option: ${1}"
    usage
    exit 1
    ;;
  esac
  shift
done

TORRENT_FILE="$(inotifywait --quiet --format '%w%f' --event attrib --include ".*\.torrent" "${WATCH_DIRECTORY}")"
FILE_TYPE="$(file --brief "${TORRENT_FILE}")"

if [[ "${FILE_TYPE}" != "BitTorrent file" ]]; then
  log_error "File ${TORRENT_FILE} is not a BitTorrent file: ${FILE_TYPE}."
  exit 1
else
  log_info "Moving ${TORRENT_FILE} to ${TARGET_HOST} in ${DEST_DIRECTORY}"
  if ! scp "${TORRENT_FILE}" "${TARGET_HOST}:${DEST_DIRECTORY}"; then
    log_error "Could not transfer file"
    exit 1
  fi
  log_ok "DONE"
fi

rm "${TORRENT_FILE}"

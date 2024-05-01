#!/usr/bin/env bash



for sec in {1..10}; do

  PERCENT=$(( sec * 10 ))
  TEXT="$(( 10 - sec )) sec" 
  echo $PERCENT | whiptail --gauge "$TEXT" 6 60 0

  if [ $(( 10 - sec )) -ne 0 ]; then
    espeak "$(( 10 - sec ))" >/dev/null 2>&1
  else
    espeak "Shutdown"  >/dev/null 2>&1
  fi
  sleep 1

done 

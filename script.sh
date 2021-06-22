#!/bin/bash
url_list=( http://www.bbc.co.uk http://www.cnn.com http://www.msn.com )

#Number of users to mimic simultaneously
users=20

function one_user () {
  local user=$1
  while [ 1 -eq 1 ]; do
    local wait=`expr $RANDOM % 120 + 30`
    local n=`expr $RANDOM % 3`
    local url=${url_list[$n]}
    wget -p $url
    # echo user = $user wait = $wait url = $url
    sleep $wait
  done
  }

for (( user = 1; user <= $users; user++ )); do
  one_user $user &
done

#!/bin/bash
$contname = $(sudo docker ps -a -q)
if [[ "$contname" != "" ]]; then
  sudo docker stop $(sudo docker ps -a -q)
  sudo rm $(sudo docker ps -a -q)
else
  echo "Nothing to remove in dpocker"
fi

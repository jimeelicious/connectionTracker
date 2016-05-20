#!/bin/bash

# Connection Tracker v0.10
# Pings a server and informs user when internet
# connectivity is restored, via a webpage.


server=google.com
count=1
start="`date +%R\ %Z`"
webpageLocation=/var/www/html/comcast

version=0.10

while true;
  do ping -c1 -W1 $server &> /dev/null

  if [ $? -eq 0 ]; then
    echo "Internet restored at `date +%R\ %Z`" > /home/jimmy/internet
    echo -e "<title>Connection Tracker v$version</title><body>Start: $start<br>Times pinged: $count<br><b>Internet restored at `date +%R\ %Z`</b></body>" > $webpageLocation
    exit 100
  fi

  echo "<title>Connection Tracker v$version</title><body>Start: $start<br>Times pinged: $count</body>" > $webpageLocation
  let count=$count+1
  sleep 59
  done

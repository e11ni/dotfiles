#!/bin/sh
count=`ps aux | grep -c code`
if [ "$count" -le "4" ]; then
  code
else
  i3-msg "[class=code] focus"
fi

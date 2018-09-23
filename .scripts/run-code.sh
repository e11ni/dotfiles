#!/bin/sh
count=`ps aux | grep -c code`
if [ $count -eq 3 ]; then
  code
else
  i3-msg "[class=code] focus"
fi

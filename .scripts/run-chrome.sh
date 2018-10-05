#!/bin/sh
count=`ps aux | grep -c chrome`
if [ "$count" -le "4" ]; then
  google-chrome --proxy-auto-detect
else
  i3-msg "[class=Google-chrome] focus"
fi

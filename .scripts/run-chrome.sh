#!/bin/sh
count=`ps aux | grep -c chrome`
if [ $count -eq 3 ]; then
  google-chrome-stable
else
  i3-msg "[class=Google-chrome] focus"
fi

#!/bin/sh
count=`ps aux | grep -c chromium`
if [ "$count" -le "4" ]; then
  chromium --proxy-auto-detect
else
  i3-msg "[class=Chromium] focus"
fi

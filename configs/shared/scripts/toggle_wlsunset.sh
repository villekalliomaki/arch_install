#!/usr/bin/bash
if pidof wlsunset; then
   killall -9 wlsunset
else
   wlsunset -l 60.192059 -L 24.945831 -t 3500 -T 6500
fi
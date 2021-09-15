sudo rm -f /tmp/.X${DISPLAY#:}-lock
nohup /usr/bin/Xvfb $DISPLAY -screen 0 $RESOLUTION -ac +extension GLX +render -noreset > /dev/null || true &
while [[ ! $(xdpyinfo -display $DISPLAY 2> /dev/null) ]]; do sleep .3; done
nohup startxfce4 > /dev/null || true &
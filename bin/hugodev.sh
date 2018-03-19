#!/bin/sh
# run Hugo in dev mode on an externally accessible interface (not localhost)
# cd into your Hugo project and then run this.
PORT=1313
# matches first global interface, will not always be "eth0" 
IPADDR=`ip a show scope global | grep -m 1 'inet '| awk '{print $2}' | cut -d / -f1`

BASEURL="http://$IPADDR:$PORT"

echo "Serving on: " $IPADDR ":" $PORT " baseURL: " $BASEURL
# -v verbose log output
# -D build including drafts 
# -F build including future dated content 
# --disableFastRender enable full re-render on changes
# --forceSyncStatic sync your CSS and other assets
hugo server -v -D -F --disableFastRender --forceSyncStatic  \
	--bind $IPADDR -p $PORT --baseURL $BASEURL 

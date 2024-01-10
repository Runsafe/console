#!/bin/bash
touch ~/.halted
delay=1
if [ -z "$1" ]; then
        bukkit shutdown $delay "Restarting to deploy server updates"
else
        bukkit shutdown $delay "$@"
fi
cp -Ru ~updates/* ~bukkit/plugins/
find ~updates -type f -delete
bukkit start
rm ~/.halted


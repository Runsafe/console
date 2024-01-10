#!/bin/bash
cd ~
. .bash_profile
touch ~/.halted
delay=5
if [ -z "$1" ]; then
        bukkit shutdown $delay "Daily restart"
else
        bukkit shutdown $delay "$@"
fi
cp -Ru ~/updates/* ~/bukkit/plugins/ 2> /dev/null
find ~/updates -type f -delete
mv ~/bukkit/server.log ~/log/`date +%Y.%m.%d.%H.%M`.log
cd ~/bukkit/logs
mv *.gz ~/log/
cd ~/bukkit/logging
for log in *.log; do
        mv $log ~/log/`date +%Y.%m.%d.%H.%M`_$log
done
cd ~
bukkit start
bukkit command "rs config reload"
rm ~/.halted

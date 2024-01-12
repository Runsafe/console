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

# Apply updates
cp -Ru ~/updates/* ~/bukkit/plugins/ 2> /dev/null

# Clean up staged updates
find ~/updates -type f -delete

# Rotate bukkit log
mv ~/bukkit/server.log ~/log/`date +%Y.%m.%d.%H.%M`.log

# Archive old logs
cd ~/bukkit/logs
mv *.gz ~/log/

# Rotate custom logs
cd ~/bukkit/logging
for log in *.log; do
        mv $log ~/log/`date +%Y.%m.%d.%H.%M`_$log
done
cd ~

# Start server back up
bukkit start
bukkit command "rs config reload"
rm ~/.halted

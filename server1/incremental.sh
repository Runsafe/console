#!/bin/bash
# Incremental backups of minecraft
. .bash_profile

#bukkit command 'dog speak Hourly back-up, the server may lag for a moment!'
cd ~/backups
prev='n'
# Move all folders up by one
# T-24 -> T-n, T-23 -> T-24, ..., T-0 -> T-1
for n in {24..0..-1}; do
        if [ -d "T-$n" ]; then
                mv "T-$n" "T-$prev"
        fi
        prev=$n
done
# Turn what was T-24 into T-0
if [ -d "T-n" ]; then
        mv "T-n" "T-0"
fi
# Update T-0 to contain the same things that was in the old T-0
if [ -d "T-1" ]; then
        cp -fal "T-1/." "T-0"
fi

#bukkit command 'save-all'
sleep 5
cd ~
# Database backups
nice -n 19 mysqldump -q --single-transaction -u$SERVER_DB_USERNAME -p$SERVER_DB_PASSWORD $SERVER_DB > bukkit/backup.sql
nice -n 19 mysqldump -q --single-transaction -u$SERVER_DB_USERNAME -p$SERVER_DB_PASSWORD $SERVER_DB runsafeBanks > bukkit/bankBackup.sql

# Update T-0 to match current server state
nice -n 19 rsync -a --delete bukkit/ "backups/T-0/"

# Update backup timestamp
touch backups/T-0/

echo 'Backup completed'
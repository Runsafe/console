#!/bin/bash
cd ~/bukkit
echo "DELETE FROM playerNotes WHERE tier='floating';" | mysql -u$SERVER_DB_USERNAME -p$SERVER_DB_PASSWORD $SERVER_DB
grep 'floating too long' ../log/* \
| awk '{print $4}' | sort | uniq -c | sort -n \
| awk '{print "insert into playerNotes (playerName, tier, note) VALUES ('"'"'" $2 "'"'"', '"'"'floating'"'"', '"'"'floated too long x" $1 "'"'"');"}' \
| mysql -u$SERVER_DB_USERNAME -p$SERVER_DB_PASSWORD $SERVER_DB

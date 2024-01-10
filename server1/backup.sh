#!/bin/bash

if [ "$1" = "-q" ]; then
        output=false
else
        output=true
fi

cd ~

ulimit -e 19

startup=`date +%s`
function ts()
{
        ((elapsed=`date +%s` - $startup))
        $output && echo -n "[+${elapsed}s] "
}

$output && echo -n "Starting backup at "
date
ts
$output && echo "Sending 30 second warning..."
bin/server command "say Automatic daily backup - Restarting server in 30 seconds" -q
sleep 20
ts
$output && echo "Sending 10 second warning..."
bin/server command "say Automatic daily backup - Restarting server in 10 seconds" -q
sleep 10
ts
$output && echo "Stopping server..."
bin/server stop -q
ts
$output && echo "Creating tarball"
tar --exclude "dynmap/web/tiles" -cf backups/nightly.tar bukkit
rm -f backups/nightly.tar.bz2
ts
$output && echo "Starting server"
bin/server start -q
ts
$output && echo "Compressing tarball"
bzip2 backups/nightly.tar
ts
$output && echo "Done"

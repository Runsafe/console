#!/bin/bash
cd ~/bukkit
for target in */players/; do
        find ./$target -type f -mtime +180 -delete
done

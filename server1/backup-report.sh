#!/bin/bash
echo Backup report per `date`:
cd ~
du -sh backups
cd backups
du -sh T-* | sort -t - -k 2 -n -r | awk '{cmd="stat --printf %y " $2 "| sed -e s/:.*/:00/"; cmd | getline mod;printf("%-8s%-6s%s\n", $1, $2, mod)}'

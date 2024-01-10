#!/bin/bash
touch ~/.halted
if [ -z "$1" ]; then
        bukkit shutdown 5 "Shutting down"
else
        bukkit shutdown 5 "$@"
fi

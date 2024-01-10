#!/bin/bash
bukkit command "puppet KruKamera All players will be disconnected in 30 seconds for a brief hotfix deployment."
sleep 30s
bukkit command "kickall Server update deployed! Please re-log."
bukkit command "save-all"
sleep 1s
bukkit command "reload"

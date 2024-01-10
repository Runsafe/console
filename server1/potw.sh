#!/bin/bash
mysql -u$SERVER_DB_USERNAME -p$SERVER_DB_PASSWORD $SERVER_DB < ~/potw.sql
mysql -u$SERVER_DB_USERNAME -p$SERVER_DB_PASSWORD $SERVER_DB < ~/zbuilders.sql
bukkit command 'rs config rel WarpDrive'
bukkit command 'pex reload'
bukkit command 'dog speak Plot of the week has been updated, go check it out!'

#!/usr/bin/env bash

# README:
# DEPS: coreutils, tar

# Change these directories for best fit
$Music=~/Music/
$Documents=~/Docs/
$Code=~/Git/
$Osu=~/.local/share/osu/
$Pictures=~/Images/

$ExHdd=sda1

sudo mkdir -p "/mnt/$ExHdd"
sudo mount "/dev/$ExHdd" "/mnt/$ExHdd"
sync
cd "/mnt/$ExHdd"

echo ""

# Archiving
tar -cvf Documents.tar.gz "$Documents"
sync
mv -v ~/Documents.tar.gz .
sync

echo ""

tar -cvf Code.tar.gz "$Code"
sync
mv -v ~/Code.tar.gz .
sync

echo ""

tar -cvf Osu.tar.gz "$Osu"
sync
mv -v ~/Osu.tar.gz .
sync

echo ""

tar -cvf Pictures.tar.gz "$Pictures"
sync
mv -v ~/Pictures.tar.gz .
sync

echo ""

tar -cvf Music.tar.gz "$Music"
sync
mv -v ~/Music.tar.gz .
sync

echo "All done!"

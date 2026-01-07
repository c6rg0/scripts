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
watch -d grep -e Dirty: -e Writeback: /proc/meminfo

cd "/mnt/$ExHdd"

echo ""

# Archiving
tar -cvf Documents.tar.gz "$Documents"
sync
watch -d grep -e Dirty: -e Writeback: /proc/meminfo

echo ""

mv -v ~/Documents.tar.gz .
sync
watch -d grep -e dirty: -e writeback: /proc/meminfo

echo ""

tar -cvf Code.tar.gz "$Code"
sync
watch -d grep -e Dirty: -e Writeback: /proc/meminfo

echo ""

mv -v ~/Code.tar.gz .
sync
watch -d grep -e dirty: -e writeback: /proc/meminfo

echo ""

tar -cvf Osu.tar.gz "$Osu"
sync
watch -d grep -e Dirty: -e Writeback: /proc/meminfo

echo ""

mv -v ~/Osu.tar.gz .
sync
watch -d grep -e dirty: -e writeback: /proc/meminfo

echo ""

tar -cvf Pictures.tar.gz "$Pictures"
sync
watch -d grep -e Dirty: -e Writeback: /proc/meminfo

echo ""

tar -cvf Music.tar.gz "$Music"
sync
watch -d grep -e Dirty: -e Writeback: /proc/meminfo

echo ""

mv -v ~/Documents.tar.gz .
sync
watch -d grep -e dirty: -e writeback: /proc/meminfo

echo "All done!"


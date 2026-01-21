#!/usr/bin/env bash

# README:
#
# DEPS: coreutils, tar
#
# WARNING: This may overwrite existing files (especially osu files),
# always have a backup of your files if needed.
#
# Not tested until I backup my files, also, I haven't made the script move all
# files from the extracted archive folder to the output folder (after using this,
# code.tar.gz will extract to ~/Code/code/).

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

# Extracting
cp -v Documents.tar.gz "$Documents"
sync
tar -xvf Documents.tar.gz -C "$Documents/"
sync

echo ""

cp -v Code.tar.gz "$Code"
sync
tar -xvf Code.tar.gz -C "$Code/"
sync

echo ""

cp -v Osu.tar.gz "$Osu/"
sync
tar -xvf Osu.tar.gz -C "$Osu"
sync

echo ""

cp -v Pictures.tar.gz "$Pictures/"
sync
tar -xvf Pictures.tar.gz -C "$Pictures"
sync

cp -v Music.tar.gz "$Music/"
sync
tar -xvf Music.tar.gz -C "$Music"
sync

echo ""

cp -v Documents.tar.gz "$Documents/"
tar -xvf Documents.tar.gz -C "$Documents/"
sync

echo "All done!"


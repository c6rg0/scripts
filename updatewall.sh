#!/usr/bin/env bash
# Dependencies: bash, coreutils, procps-ng, awww, gammastep

killGammastep(){
    [ `pgrep -n gammastep` ] && return 1 || return 0

    if [ 1 ]; then 
        pkill gammastep
    fi
}

# Change these variables to fit your needs
earlyDusk=4
dayTime=6
lateDusk=20
nightTime=22

# Wallpapers from: 
# https://basicappleguy.com/basicappleblog/dynamic-tahoe-wallpapers
dayWallpaper=~/Pictures/Macos/TahoeDay.png
duskWallpaper=~/Pictures/Macos/TahoeDawn.png
nightWallpaper=~/Pictures/Macos/TahoeNight.png

killGammastep
hour=$(date +%k)

# Early dusk
if [[ $hour -ge $earlyDusk ]] && [[ $hour -lt $dayTime ]]; then
    awww img $duskWallpaper

# Day time 
elif [[ $hour -ge $dayTime ]] && [[ $hour -lt $lateDusk ]]; then
    awww img $dayWallpaper

# Late dusk
elif [[ $hour -ge $lateDusk ]] && [[ $hour -lt $nightTime ]]; then
    awww img $duskWallpaper

# Night time 
elif [[ $hour -ge $nightTime ]] && [[ $hour -lt $earlyDusk ]]; then
    gammastep -O 4500K
    awww $nightWallpaper
fi

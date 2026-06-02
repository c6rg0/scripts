#!/usr/bin/env bash
# Dependencies: bash, coreutils, yt-dlp, ffmpeg
#
create_temp()
{ 
    RANDOM_DIR=$(/usr/bin/env date | sha256sum)
    RANDOM_DIR=${RANDOM_DIR:0:64}

    mkdir -p "/tmp/$RANDOM_DIR"
    cd "/tmp/$RANDOM_DIR"
}

youtube()
{
    echo -e "YouTube audio downloader:"
    echo -e "(Note, this won't download playlists)\n"
    read -p "URL: " URL
    URL=${URL:0:43}
    echo ""

    yt-dlp -x --audio-format mp3 "$URL"

    TITLE=$(ls)
    CUT_TITLE=${TITLE::-18}
}

location()
{
    echo ""
    echo -e "Type in the desired file name (don't include '.mp3')"
    echo -e "- Press enter for '$CUT_TITLE'"
    read -p "" INPUT_NAME
    echo ""

    mkdir -p ~/Music/

    if [ -z "$INPUT_NAME" ]; then
        mv -v "$TITLE" ~/Music/"$CUT_TITLE".mp3
    else
        mv -v "$TITLE" ~/Music/"$INPUT_NAME".mp3
    fi

    cd ~
    rm -rf "/tmp/$RANDOM_DIR"
}

create_temp
youtube
location

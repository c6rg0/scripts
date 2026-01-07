#!/usr/bin/env bash
# README:
# Dependencies: yt-dlp, ffmpeg,
# Nothing more.
#!/usr/bin/env bash
# README:
# Dependencies: yt-dlp, ffmpeg
# Nothing more.

echo "YT audio downloader:"
echo "(NOTE: This won't download playlists)"
echo ""

read -p "URL > " URL
URL=${URL:0:43}

RANDOMDIR=$(/usr/bin/env date | sha256sum)
RANDOMDIR=${RANDOMDIR:0:64}

mkdir -p "/tmp/$RANDOMDIR"
cd "/tmp/$RANDOMDIR"

yt-dlp -x --audio-format mp3 "$URL"

title=$(ls)

echo ""
echo "Choose song name;"
echo "(press enter for): $title"
read -p "> " title_input
echo ""

mkdir -p ~/Music/

if [ -z "$title_input" ]; then
    mv -v "$title" ~/Music/
else
    mv -v "$title" ~/Music/"$title_input".mp3
fi

cd ~
rm -rf "/tmp/$RANDOMDIR"

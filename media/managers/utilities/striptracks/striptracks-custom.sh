#!/bin/bash

# https://github.com/linuxserver/docker-mods/tree/radarr-striptracks

# Both for Radarr and Sonarr

# Place in `/config`

# Make executable: `chmod +x /config/striptracks-custom.sh`

# If running manualy use -f for filename

# . /usr/local/bin/striptracks.sh --audio :org:eng:spa:nld:dut:jpn:chi:zho:und --subs :org:eng:spa:nld:dut --reorder

# keep the list of audio languages
# keep the list of subtitle tracks
# reorder audio and subtitles
# set the default subtitles track to the first non-forced English track
# . /usr/local/bin/striptracks.sh --audio :org:eng:spa:nld:dut:jpn:chi:zho:und --subs :org:eng:spa:nld:dut:jpn:chi:zho --reorder --set-default-audio :org --set-default-subs :eng-f
. /usr/local/bin/striptracks.sh \
    --audio :org:eng:spa:nld:jpn:zho:und \
    --subs  :org:eng:spa:nld:jpn:zho \
    --reorder \
    --set-default-audio :org \
    --set-default-subs :eng-f

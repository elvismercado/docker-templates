#!/bin/bash

# https://github.com/linuxserver/docker-mods/tree/radarr-striptracks

# Both for Radarr and Sonarr

# Place in `/config`

# Make executable: `chmod +x /config/striptracks-custom.sh`

# If running manualy use -f for filename

. /usr/local/bin/striptracks.sh ---audio :org:eng:spa:nld:dut:jpn:chi:zho:und --subs :org:eng:spa:nld:dut --reorder
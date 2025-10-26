# Config

Config file: /data/serverfiles/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

## Changing session name

[SessionSettings]
SessionName=MyArkSurvival1

## Changing amount of players

[/Script/Engine.GameSession]
MaxPlayers=10

## Run LinuxGSM commands

as `linuxgsm` user
`docker exec -it --user linuxgsm arkserver ./arkserver details`

connect to a shell:
`docker container exec -it --user linuxgsm arkserver /bin/bash`

## Edit `Game.ini`
`docker container exec -it --user linuxgsm arkserver /bin/bash`
`cd /app/serverfiles/ShooterGame/Saved/Config/LinuxServer/`
`nano Game.ini`

## Edit `GameUserSettings.ini`
`docker container exec -it --user linuxgsm arkserver /bin/bash`
`cd /app/serverfiles/ShooterGame/Saved/Config/LinuxServer/`
`nano GameUserSettings.ini`

## Edit `arkserver.cfg`
`cd /data/config-lgsm/arkserver/`
`nano arkserver.cfg`
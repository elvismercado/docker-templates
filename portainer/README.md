# Container deploy commands

## Default from docs

`docker volume create portainer_data`

`docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest`

## Unraid Appdata mapping example

Its basically the same command only there is no need to create a volume since we are going to pass our own folder to place data.
`docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/user/appdata/portainer-ce:/data portainer/portainer-ce:latest`

## Watchtower enabled example

`docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/user/appdata/portainer-ce:/data --label com.centurylinklabs.watchtower.enable=true portainer/portainer-ce:latest`

## Access at

Port 8000 is for Edge Compute
Port 9000 is for HTTP
Port 9443 is for HTTPS
https://localhost:9443

## Updating Portainer-CE

1. `docker stop portainer`
2. `docker rm portainer`
3. `docker pull portainer/portainer-ce:latest`
4. Then use the proper docker run on your system.

# Deploy Options

## default

docker compose -f docker-compose.yml up -d

## enable edge compute

docker compose -f docker-compose.yml -f docker-compose.edgecompute.yml up -d

## enable legacy ui

docker compose -f docker-compose.yml -f docker-compose.legacy.yml up -d

## watchtower label

docker compose -f docker-compose.yml -f ../watchtower/docker-compose.watchtower.yml up -d

# One liner (two liner)

- `docker volume create portainer_data`
- `docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts`

## Unraid Appdata mapping example

Its basically the same command only there is no need to create a volume since we are going to pass our own folder to place data.

- `docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/user/appdata/portainer:/data portainer/portainer-ce:latest`

## Access at

https://localhost:9443

- 9443 - default UI port (HTTPS)
- 9000 - legacy UI port (HTTP)
- 8000 - Edge Compute port

## Updating Portainer-CE

1. `docker stop portainer`
2. `docker rm portainer`
3. `docker pull portainer/portainer-ce:lts`
4. Then use the proper docker run on your system. (see above)

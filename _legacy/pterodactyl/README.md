# Initial setup
docker-compose up

CTRL + C
docker container start pterodactyl-cache
docker container start pterodactyl-database
docker container start pterodactyl-panel

docker exec -it pterodactyl-panel php artisan p:user:make

in panel: create new location

in panel: create new node

in panel: copy node configuration

add node configuration to wings config.yml
```
docker:
  network:
    interfaces:
      v4:
        subnet: 10.33.35.0/16
        gateway: 10.33.35.1
```

# Get the env variables
`docker inspect pufferpanel --format='{{range .Config.Env}}{{println .}}{{end}}'`

# Add a user
`docker exec -it pufferpanel /pufferpanel/pufferpanel user add`
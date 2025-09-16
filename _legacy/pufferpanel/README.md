# Get the env variables
`docker inspect pufferpanel --format='{{range .Config.Env}}{{println .}}{{end}}'`

# Add a user
`docker exec -it pufferpanel /pufferpanel/pufferpanel user add`
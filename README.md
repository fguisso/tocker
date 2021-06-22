# Tocker

One Tor container to rule then all.

# Get started

- build the container `docker build --tag tocker .`
- add alias to your zshrc or another profile.
- `tocker-net` create the containers network
- `tocker-start` running Tor cointainer and attach
- `tocker <antoher_image>` runs differents imagens proxy by Tor automagically

e.g. `tocker curl` runs curl image througt Tor

- `tocker-service` running Tor container in background
- `tocker-log` attach to Tor container logs
- `tocker-down` 

# Alias
```
alias tocker-start='docker run --rm --name tor --net=onion tocker'
alias tocker-service='docker run -d --rm --name tor --net=onion tocker'
alias tocker-net='docker network create onion'
alias tocker-log='docker logs -f tor'

tocker-down () {
    docker stop tor
    docker network rm onion
}

tocker () {
    docker run --rm -it --env HTTP_PROXY="tor:9080" --env HTTPS_PROXY="tor:9080" --net=onion $*
}
```

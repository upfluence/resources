#!/bin/sh

# clean all non running containers
docker rm $(docker ps -q -f status=exited)

# attempt to clean all unused images
docker rmi $(docker images -a -q)

exit 0

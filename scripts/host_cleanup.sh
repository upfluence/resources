#!/bin/sh

# clean all non running containers
docker rm $(docker ps -q -f status=exited)

# attempt to clean all unused images
docker images -f dangling=true -q | xargs docker rmi

curl -sL https://raw.githubusercontent.com/upfluence/sensu-coreos/master/clients/sensu-fleet-client/export_infos.sh \
  > export_infos.sh

sh export_infos.sh

exit 0

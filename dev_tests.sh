#!/bin/bash

env_args=

provider=$(docker info | awk -F ' provider=' '{print $2}' | tail -n1)
if [[ "$provider" = "virtualbox" ]]; then
    env_args="-e http_proxy=http://10.0.2.2:3128 -e https_proxy=http://10.0.2.2:3128"
fi

docker run -t -v $(pwd):/ansible -w /ansible $env_args stackio/ansible-centos6 ./tests/test.sh -r 5
docker run -t -v $(pwd):/ansible -w /ansible $env_args stackio/ansible-centos6 /tests/test.sh -r 10
docker run -t -v $(pwd):/ansible -w /ansible $env_args stackio/ansible-centos7 ./tests/test.sh -r 5
docker run -t -v $(pwd):/ansible -w /ansible $env_args stackio/ansible-centos7 ./tests/test.sh -r 10

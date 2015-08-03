#!/bin/bash
# run from parent directory
set -ex

docker run -it -v $(pwd):/ansible -w /ansible stackio/ansible-centos6 ./tests/test.sh -r 5
docker run -it -v $(pwd):/ansible -w /ansible stackio/ansible-centos6 ./tests/test.sh -r 10
docker run -it -v $(pwd):/ansible -w /ansible stackio/ansible-centos7 ./tests/test.sh -r 5
docker run -it -v $(pwd):/ansible -w /ansible stackio/ansible-centos7 ./tests/test.sh -r 10

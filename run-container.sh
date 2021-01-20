# Disable exit on non 0
set +e

docker container stop demos
docker container rm -f demos

# on linux
docker image rm -f $(docker images --filter "dangling=true" -q --no-trunc)
# on windows
# for /f "tokens=*" %i in ('docker images --filter "dangling=true" -q --no-trunc') do docker image rm -f %i

# Enable exit on non 0
set -e

# docker pull earlwaud/html_demos:latest
docker container run -d -p 9099:8080 --name demos earlwaud/html_demos:latest


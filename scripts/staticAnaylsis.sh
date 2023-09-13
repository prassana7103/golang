#!/bin/bash
set -x


# Check if a container with the name 'static-analysis' exists
if [[ "$(docker ps -a -q -f name=static-analysis)" ]]; then
    echo "Container 'static-analysis' already exists."
else
    # Create and start the 'static-analysis' container
    docker pull ubuntu
    docker run -v /var/lib/jenkins/workspace/demo:/var/lib/jenkins/workspace/demo -d -it --name static-analysis ubuntu tail -f /dev/null
fi

# Execute specific commands inside the container
docker exec -i static-analysis /bin/bash -c '
    # Inside the container: update packages and install Go and staticcheck
    apt-get update
    apt-get install -y golang
    go mod init github.com/suyash-chavan/golang
    go get honnef.co/go/tools/cmd/staticcheck
'

# Exit the container (if it was just created)
# docker stop static-analysis

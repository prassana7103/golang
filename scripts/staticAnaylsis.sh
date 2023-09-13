#!/bin/bash
set -x
# Check if a container with the name 'static-analysis' exists
if [[ "$(docker ps -a -q -f name=static-analysis)" ]]; then
    echo "Container 'static-analysis' already exists."
else
    # Pull the Ubuntu image
    docker pull ubuntu
    docker run -v golang:/var/lib/jenkins/workspace/demo -d -it --name static-analysis ubuntu /bin/bash 
    docker exec -i static-analysis /bin/bash -c '
        # Inside the container: update packages and install Go and staticcheck
        apt-get update
        apt-get install -y golang
        go get honnef.co/go/tools/cmd/staticcheck
        ls
        cd cmd
        staticcheck ./...

        # Exit the container
        exit
    '

EOF

    # Commit changes to a new image (optional)
    #docker commit static-analysis my-ubuntu-with-staticcheck
fi
ls

# Run the container with staticcheck (optional)
#docker run -it my-ubuntu-with-staticcheck /bin/bash

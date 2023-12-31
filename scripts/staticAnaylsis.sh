#!/bin/bash
set -x

# Check if a container with the name 'static-analysis' exists
if [[ "$(docker ps -a -q -f name=static-analysis)" ]]; then
    echo "Container 'static-analysis' already exists."
else
    # Create and start the 'static-analysis' container
    docker pull golang
    docker run -v /var/lib/jenkins/workspace/demo:/var/lib/jenkins/workspace/demo -d -it --name static-analysis ubuntu tail -f /dev/null
fi

# Execute specific commands inside the container
docker exec -i static-analysis /bin/bash -c '
    apt-get update
    apt-get install -y wget
    wget https://golang.org/dl/go1.19.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
    go version
    go install honnef.co/go/tools/cmd/staticcheck@latest
    cd /var/lib/jenkins/workspace/demo
    /root/go/bin/staticcheck -f=text ./... > analysis_report
'

# Exit the container (if it was just created)
# docker stop static-analysis

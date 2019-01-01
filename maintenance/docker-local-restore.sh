#!/bin/sh

LOCATION="$HOME/Documents/develop/docker-sshable"
NO_CREATE_CONTAINER="ubuntu14 ubuntu12"
# Create docker network bridge
docker network create --driver bridge --subnet 192.168.56.33/27 --gateway 192.168.56.33 -o "com.docker.network.bridge.name=docker-bridge" docker-bridge
# Build image
for docker_file in $(find $LOCATION/Dockerfile* -type f -printf "%f\n"); do 
    echo $docker_file
    mv $LOCATION/$docker_file $LOCATION/Dockerfile
    current_system=${docker_file##*.}
    docker stop atb00ker/sshable:$current_syste
    docker remove atb00ker/sshable:$current_syste
    docker image remove atb00ker/sshable:$current_system
    docker build --tag atb00ker/sshable:$current_system $LOCATION
    mv $LOCATION/Dockerfile $LOCATION/$docker_file
done
# Create container
for docker_file in $(find $LOCATION/Dockerfile* -type f -printf "%f\n"); do 
    current_system=${docker_file##*.}
    # Skip in case current_system is in NO_CREATE_CONTAINER
    echo $NO_CREATE_CONTAINER | grep -q ${current_system} 
    if [ $? -ne 0 ]; then
        current_ip=$(grep $current_system /etc/hosts | cut -d' ' -f 1)
        current_name=$(grep $current_system /etc/hosts | cut -d' ' -f 2)
        docker run -dit --name "$current_name" --net docker-bridge --ip=$current_ip atb00ker/sshable:$current_system
    fi
done
# Push images
for docker_file in $(find $LOCATION/Dockerfile* -type f -printf "%f\n"); do 
    echo $docker_file
    current_system=${docker_file##*.}
    docker push atb00ker/sshable:$current_system
done

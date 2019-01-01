#!/bin/sh

# Push images
for docker_file in $(find $TRAVIS_BUILD_DIR/Dockerfile* -type f -printf "%f\n"); do 
    echo $docker_file
    current_system=${docker_file##*.}
    docker push atb00ker/sshable:$current_system
done

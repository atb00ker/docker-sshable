#!/bin/sh

# Build image
for docker_file in $(find $TRAVIS_BUILD_DIR/Dockerfile* -type f -printf "%f\n"); do 
    echo $docker_file
    mv $TRAVIS_BUILD_DIR/$docker_file $TRAVIS_BUILD_DIR/Dockerfile
    current_system=${docker_file##*.}
    docker build --tag atb00ker/sshable:$current_system $TRAVIS_BUILD_DIR
    mv $TRAVIS_BUILD_DIR/Dockerfile $TRAVIS_BUILD_DIR/$docker_file
done
# Push images
for docker_file in $(find $TRAVIS_BUILD_DIR/Dockerfile* -type f -printf "%f\n"); do 
    echo $docker_file
    current_system=${docker_file##*.}
    docker push atb00ker/sshable:$current_system
done

#!/bin/bash

CODEPATH="/exdata3/lijing/code"
# CODEPATH="/data/code"

if [ "$1" == "build" ]; then
    echo "Building Docker image..."
    docker build -t android_build .
elif [ "$1" == "run" ]; then
    echo "Running Docker container..."
    docker run -v ${CODEPATH}/workspace:/workspace -v $(pwd):/scripts -v ${CODEPATH}/data:/data android_build
elif [ "$1" == "shell" ]; then
    docker run -v ${CODEPATH}/workspace:/workspace -v $(pwd):/scripts -it android_build /bin/bash
else
    echo "Invalid argument. Use 'build' to build the image or 'run' to run the container."
    exit 1
fi

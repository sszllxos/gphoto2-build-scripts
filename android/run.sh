#!/bin/bash



if [ "$1" == "build" ]; then
    echo "Building Docker image..."
    docker build -t android_build .
elif [ "$1" == "run" ]; then
    echo "Running Docker container..."
    docker run -v /data/code/workspace:/workspace -v $(pwd):/scripts android_build
else
    echo "Invalid argument. Use 'build' to build the image or 'run' to run the container."
    exit 1
fi

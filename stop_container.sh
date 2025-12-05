#!/bin/bash
set -e

containers=$(docker ps -q)

if [ -n "$containers" ]; then
    docker rm -f $containers
    echo "All running containers removed."
else
    echo "No running containers."
fi

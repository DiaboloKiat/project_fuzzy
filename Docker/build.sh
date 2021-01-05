#!/bin/sh

if [ ! $2 ]; then
    echo "missing arguments"
    return
fi
if [ ! $2 ]; then
    echo "missing password"
    return
fi

docker build -f simulation.dockerfile -t diabolokiat/project_fuzzy:gz9_melodic --build-arg username=$1 --build-arg password=$2 .

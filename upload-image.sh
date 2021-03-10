#!/bin/bash

ecrAddress=$1
ecrName=$2
region=$3


if [ -z "$ecrAddress" ]; then
  echo "ecr endpoint not set";
  exit 1;
fi;

if [ -z "$ecrName" ]; then
  echo "repository name not set";
  exit 1;
fi;

if [ -z "$region" ]; then
  echo "Aws Region not set";
  exit 1;
fi;




echo "building docker images"
docker build -t greeter_client greeter_client/.
docker build -t greeter_server greeter_server/.

echo "logging in to ecr"
aws ecr get-login-password --region $region  | docker login --username AWS --password-stdin $ecrAddress


docker tag greeter_client:latest $ecrAddress/$ecrName:greeter_client
docker tag greeter_server:latest $ecrAddress/$ecrName:greeter_server

echo "pushing docker images to ecr"
docker push $ecrAddress/$ecrName:greeter_client
docker push $ecrAddress/$ecrName:greeter_server

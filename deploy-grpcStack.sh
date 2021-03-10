#!/bin/bash

stackName=$1


if [ -z "$stackName" ]; then
  echo "Stack name not set";
  exit 1;
fi;




echo "Deploying grpc stack "



aws cloudformation deploy \
--template-file grpc-stack.yaml \
--stack-name "$stackName" \
--parameter-overrides file://parameters.json \
--capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM || exit 1

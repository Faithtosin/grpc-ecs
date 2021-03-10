#!/bin/bash

stackName=$1

if [ -z "$stackName" ]; then
  echo "Stack name not set";
  exit 1;
fi;

echo "Deploying VPC stack"



aws cloudformation deploy \
--template-file vpc-stack.yaml \
--stack-name "${stackName}" || exit 1

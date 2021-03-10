#!/bin/bash

repo=$1


if [ -z "$repo" ]; then
  echo "repo not set";
  exit 1;
fi;



echo "creating $repo "


aws ecr create-repository --repository-name $repo
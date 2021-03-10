# grpc-ecs




- Run `sh create-ecr.sh grpc-repo`
- Copy aside the repository uri "repositoryUri": "xxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/grpc-repo".  
  -- EcrAddress will be the first part of the repository uri : "xxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com"  
  -- EcrName will be the second part of the repository uri : "grpc-repo"

- Run `sh upload-image.sh "698324764230.dkr.ecr.us-east-1.amazonaws.com" "grpc-repo" "us-east-1"`  
 -- Please Make sure upload-image.sh and cloudformation stacks are deployed in the same region to prevent errors.

- Run `sh deploy-vpcStack.sh "vpc-stack"`
- Run `aws cloudformation describe-stacks --stack-name "vpc-stack" --query "Stacks[0].Outputs[]"`
- Update the parameters.json file with neccessary parameters
- Run `sh deploy-grpcStack.sh "Grpc-SampleApp"`

## Hello World
Check the ECS Service logs  
- Server Service logs should say `2021/03/10 05:48:48 Received: world`
- Client Service logs should say `2021/03/10 05:48:48 Greeting: Hello world`
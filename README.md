# Docker image containing NodeJS, Python3, Serverless Framework, AWS SAM and Yarn.

## Usage

### Build Locally

If you want to build and use your own local image

```bash
# build image locally
$ make build
# go inside the container
$ make shell
```

## Example

`example/apigw` is an example on how to use dockerless.

## Update Docker image

### New version of Serverless Framework

1. Change `SERVERLESS` of `Dockerfile`
2. Update `DOCKERLESS_VERSION` of `Makefile`
3. Change version of dockerless in `example/apigw/docker-compose`
4. Build and test locally (test also the apigw example)
5. Commit and push the changes
6. Tag the commit with the command `$ make tag`
5. Go to Docker Image Store
8. In `Build Details` tab, you should now see the new tag kicking off

### Fix for the current version

1. Do the fixes you want to do
2. Build and test locally (test also the apigw example)
3. Commit and push the changes
4. Run `$ make tag`
5. Go to Docker Image Store
6. In `Build Details` tab, you should now see build the tag kicking off

## Docker image

The Docker image has the following:

- [Node](https://hub.docker.com/_/node/) 8.12 (Alpine): we leverage Babel to be compatible with AWS Lambda runtime
- [Serverless Framework](https://serverless.com/framework/)
- [AWS SAM](https://aws.amazon.com/serverless/sam/)
- [yarn](https://github.com/yarnpkg/yarn)
- [AWS CLI](https://github.com/aws/aws-cli): required by some Serverless plug-ins to work
- zip: handy to zip your own serverless artefact

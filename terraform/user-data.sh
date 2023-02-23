#!bin/bash

export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY}"
export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_KEY}"
export AWS_DEFAULT_REGION="${AWS_REGION}"

sudo yum update -y
sudo yum install -y docker
sudo usermod -a -G docker ec2-user
newgrp docker

sudo systemctl enable docker.service
sudo systemctl start docker.service

aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 371900893685.dkr.ecr.eu-central-1.amazonaws.com
docker run -p 443:8443 371900893685.dkr.ecr.eu-central-1.amazonaws.com/go-ping:latest


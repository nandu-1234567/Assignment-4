#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -aG docker ec2-user

docker run -d \
  -p 1337:1337 \
  -e NODE_ENV=production \
  --name strapi \
  strapi/strapi

#!/bin/bash

PROJECT=homepage

npm run build

sudo docker stop $PROJECT | true

sudo docker build -t $PROJECT .

sudo docker run --rm --name $PROJECT -p 9999:80 -d $PROJECT 
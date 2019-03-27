#!/bin/bash

#create .static empty file
touch .static

#add BUILDPACK_URL to .env file
echo -e "\nBUILDPACK_URL=https://github.com/dokku/buildpack-nginx\n" >> .env

# create deploy script
echo "
    #!/bin/bash
    rm -rf dist/*
    git add -A dist
    git commit -m \"up to dokku\"
    git push dokku master " > up_dokku.sh

chmod 700 up_dokku.sh

#Remember to run on server
#dokku config:set $MYPROJECT NGINX_ROOT="dist" 
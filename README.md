# dokku-vue

## On server machine:

- Install dokku and create dokku project 
```bash
# Follow install instructions
http://dokku.viewdocs.io/dokku/

# Go to browser on and put public ip of server. And add the public ssh key.

# Create dokku project
MYPROJECT="dokku-vue" 
dokku apps:create $MYPROJECT
dokku config:set $MYPROJECT NGINX_ROOT="dist" TZ="America/Sao_Paulo" 

``` 

## Locally:

- Add public key to remote machine:
``` 

cat ~/.ssh/id_rsa.pub | ssh -i ~/.ssh/mypemfile.pem ubuntu@$PUBLIC_IP "sudo sshcommand acl-add dokku dokku"

```

- In Vue project folder

```bash

#Install all dependencies
npm install

# Run build
npm run build

# Test server locally
npm run start
# Go to localhost:5000

# Remove /dist from .gitignore

# Add dokku remote to project:
git remote add dokku dokku@$PUBLIC_IP:$MYPROJECT

# Commit changes and push to dokku remote repo
git add .
git commit -m "deploy to dokku"
git push dokku master
```

## Deployment script - see file [up.sh](https://github.com/evzpav/dokku-example-vue/blob/master/up.sh)
```bash
#remove all files from dist folder
  rm -rf dist/* 

#run build - created build files on dist folder
  npm run build 
  
#stage dist folder 
  git add -A dist 

#commit 
  git commit -m "up to dokku" 

#push to dokku origin
  git push dokku master 
  
``` 

## Change default deployment branch to 'prod' (optional)
 ```bash
  #locally
    #create branch prod locally - do once only
      git branch prod
    #go to branch prod
      git checkout prod
    #merge master branch in prod
      git merge master
   
    #This pushes local prod branch to origin master branch(dokku)
     git push dokku prod:master
 
  #on dokku VM:
   dokku git:set $MYPROJECT deploy-branch prod
   
   
 ``` 

## Add https - SSL cert
Use this https://github.com/dokku/dokku-letsencrypt

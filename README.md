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
dokku config:set $MYPROJECT TZ="America/Sao_Paulo" 

``` 

## Locally:

- Add public key to remote machine:
``` 

cat ~/.ssh/id_rsa.pub | ssh -i ~/.ssh/mypemfile.pem ubuntu@$PUBLIC_IP "sudo sshcommand acl-add dokku dokku"

```

- In Vue project folder
``` bash
# Add server.js file
# // server.js
# var express = require('express');
# var path = require('path');
# var serveStatic = require('serve-static');
# app = express();
# app.use(serveStatic(__dirname + "/dist"));
# var port = process.env.PORT || 5000;
# app.listen(port);
# console.log('server started '+ port);


# Install server.js dependencies
npm install express path serve-static --save

#Install all dependencies
npm install

# Add  "start": "node server.js" to scripts on package.json

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
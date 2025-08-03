#!/bin/bash

set -e

tee /etc/yum.repos.d/nodesource-nodejs.repo > /dev/null <<REPO
[nodesource-nodejs]
baseurl=https://rpm.nodesource.com/pub_23.x/nodistro/nodejs/x86_64
gpgkey=https://rpm.nodesource.com/gpgkey/ns-operations-public.key
REPO

yum install -y nodejs

tee app.js > /dev/null <<APP
const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello, World!\\n');
});

const port = process.env.PORT || 80;
server.listen(port, () => {
  console.log(\`Listening on port \${port}\`);
});
APP

nohup node app.js &

#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Basic stuff
npm install --unsafe-perm -g eslint nodemon node-inspector node-static npm-check typescript prettier

# Additional stuff
npm install --unsafe-perm -g meta mjml plop lerna

# 3rd party stuff
npm install --unsafe-perm -g netlify now ionic redoc-cli

# OpenAPI tools
npm install --unsafe-perm -g swaggie restful-react

# FrontEnd Framework used everyday
npm install --unsafe-perm -g create-react-app @vue/cli
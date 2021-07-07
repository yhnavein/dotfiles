#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Basic stuff
npm install --unsafe-perm -g eslint nodemon node-inspector node-static npm-check typescript prettier

# 3rd party stuff
npm install --unsafe-perm -g mjml netlify-cli now redoc-cli madge source-map-explorer

# OpenAPI tools
npm install --unsafe-perm -g swaggie restful-react

# FrontEnd Framework used everyday
npm install --unsafe-perm -g create-react-app @vue/cli expo-cli @nestjs/cli

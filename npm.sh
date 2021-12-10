#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Basic stuff
npm install --unsafe-perm -g eslint nodemon node-static npm-check typescript prettier dprint

# 3rd party stuff
npm install --unsafe-perm -g madge source-map-explorer vercel netlify-cli

# FrontEnd Framework used everyday
npm install --unsafe-perm -g @vue/cli expo-cli @nestjs/cli sucrase

#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Basic stuff
npm install --unsafe-perm -g eslint gulp-cli nodemon node-inspector node-static npm-check mocha

# Git Stats
npm install --unsafe-perm -g git-stats git-stats-importer

# Around TypeScript / Transpilers
npm install --unsafe-perm -g typescript tslint yo babel ava

# Useful stuff
npm install --unsafe-perm -g space-hogs mjml plop

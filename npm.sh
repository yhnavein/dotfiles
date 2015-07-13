#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

npm install -g bower jshint eslint grunt-cli karma-cli nodemon node-inspector node-static

npm install -g git-stats npm-check-updates git-stats-importer
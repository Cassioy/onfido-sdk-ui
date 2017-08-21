#!/bin/bash

# set path for test directory
TESTS_PATH=./test

# go to test directory
cd TESTS_PATH

# install gem dependencies
bundle install

# run cucumber tests against deployed domain
SDK_SURGE_URL="$DEPLOY_DOMAIN?async=false"
bundle exec cucumber TARGET=development USE_SECRETS=false SDK_SURGE_URL=$SDK_SURGE_URL

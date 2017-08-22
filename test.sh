#!/bin/bash

set -e

# set path for test directory
TESTS_PATH=./test

# go to test directory
cd $TESTS_PATH

# install gem dependencies using monster_rsa private key to fetch the monster gem
GIT_SSH_COMMAND="ssh -i ~/.ssh/monster_rsa" bundle install

# run cucumber tests against deployed domain
SDK_SURGE_URL="${DEPLOY_DOMAIN}?async=false"
bundle exec cucumber TARGET=development USE_SECRETS=false DEBUG=false SDK_SURGE_URL=$SDK_SURGE_URL

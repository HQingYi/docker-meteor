#!/bin/bash
export DIST_DIR=/usr/app/bundle
if [ -d ${DIST_DIR}/bundle ]; then
    DIST_DIR=${DIST_DIR}/bundle
fi
export CONF_DIR=/usr/app/config

# Prepare environment
if [ -d $CONF_DIR ]; then
    for env_file in $CONF_DIR/*.sh; do
        [[ -f $env_file ]] && echo "Loading config file: $env_file" && source $env_file
    done
fi
[[ -f $CONF_DIR/settings.json ]] && export METEOR_SETTINGS="$(cat $CONF_DIR/settings.json)"

# Install NPM modules
if [ -e ${DIST_DIR}/programs/server ]; then
   echo "Installing NPM prerequisites..."
   cd ${DIST_DIR}/programs/server/
   npm install
else
   echo "[Warning]Unable to locate server directory!"
fi

cd ${DIST_DIR}
# listen 80
export PORT=80
echo "Starting Meteor on ${PORT}..."
exec node ./main.js

#!/bin/sh

set -ex

MODULES="typescript \
         tslint \
         @types/node \
         source-map-support \
         core-js \
         lodash \
         rxjs \
         puppeteer-core \
         @types/puppeteer-core"

GLOBAL_DIR=`yarn global dir`
for mod in $MODULES
do
    yarn global add --verbose $mod
    cd $GLOBAL_DIR/node_modules/$mod
    yarn link
done

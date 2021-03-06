#!/usr/bin/env bash
echo "\n### Installing dependencies"
npm i || exit 1

PACKAGE_VERSION=$(cat package.json | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[\",]//g' | tr -d '[[:space:]]')

echo "\n### Building release" $PACKAGE_VERSION$SNAPSHOT
export SNAPSHOT="-RELEASE";npm run build:release || exit 1

echo "\n### Copying to release directory"
mkdir release/$PACKAGE_VERSION
cp dist/*.$PACKAGE_VERSION-RELEASE.*.js release/$PACKAGE_VERSION/
cp -r dist/docs release/$PACKAGE_VERSION/

echo "\n### Copying stats.json"
cp dist/stats.json release/$PACKAGE_VERSION/

echo "\n### Copying and versioning hub.html"
cp src/hub.html release/$PACKAGE_VERSION/
HUB_HTML=$(cat release/$PACKAGE_VERSION/hub.html)
HUB_JS=$(cat release/$PACKAGE_VERSION/hub.$PACKAGE_VERSION-RELEASE.min.js)
echo "${HUB_HTML/<!--REPLACEME-->/$HUB_JS}" > release/$PACKAGE_VERSION/hub.html
cp release/$PACKAGE_VERSION/hub.html dist/latest/hub.html

echo "\n### Copying and versioning poi-list"
cp -r dist/poi-lists release/$PACKAGE_VERSION/
mkdir dist/latest/poi-lists
cp dist/poi-lists/default.json dist/latest/poi-lists/default.json

echo "\n### Increasing patch version"
git add .
git commit -a -m "Adding new release $PACKAGE_VERSION$SNAPSHOT" --no-edit

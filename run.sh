#!/bin/bash

APPNAME="test-pep517-sdist-fails"

set -x

rm -rf vendor/* || true

mkdir vendor/

cd vendor/

wget -i ../vendor.urls

cd ../

echo "Pushing with 3.6.x runtime!"

cp runtime.txt-3.6 runtime.txt

cf delete "$APPNAME"

cf push "$APPNAME" -f manifest.yml

echo "This should have worked."

echo "Pushing with 3.7.x runtime!"

cp runtime.txt-3.7 runtime.txt

cf delete "$APPNAME"

cf push "$APPNAME" -f manifest.yml

echo "This should have failed with an error relating to bdist_wheel"


#!/usr/bin/env bash

set -euo pipefail

npm run raml
bundle exec jekyll build

pushd ../../mocklab-docs
cp -rf ../mocklab-mothership/docs/_site/* .
git checkout CNAME
git add -A
git commit -m "Updated"
git push
popd
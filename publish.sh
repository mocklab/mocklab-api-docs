#!/usr/bin/env bash

set -euo pipefail

npm run raml
export MIXPANEL_ID=71b55ac57b47107ca89d12dc7c75cf00
bundle exec jekyll build

pushd ../../mocklab-docs
git reset --hard origin/gh-pages
git pull
cp -rf ../mocklab-mothership/docs/_site/* .
git checkout CNAME
git add -A
git commit -m "Updated"
git push
popd

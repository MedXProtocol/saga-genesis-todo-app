#! /bin/sh

npm run compile && \
  cd .. && \
  cd dapp && \
  npm i && \
  node --max-old-space-size=4096 scripts/build.js && \
  cd ..

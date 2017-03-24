#!/usr/bin/env bash

npm test

if [ $? -eq 0 ]
then
  echo "Elm tests run successfully."
else
  echo "Elm tests failed!" >&2
  exit 3
fi


pushd "featuretests"


NODE_ENV=test ./gradlew test

if [ $? -eq 0 ]
then
  echo "Feature tests tests run successfully."
else
  echo "Feature tests failed!" >&2
  exit 3
fi


popd
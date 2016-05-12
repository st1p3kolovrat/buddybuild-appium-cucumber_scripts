buddybuild_prebuild.sh


#!/usr/bin/env bash

echo "Set Android Home"
export ANDROID_HOME=/Users/buddybuild/.android-sdk

echo '=== Detected android command, run android list sdk --all'
android list sdk --all

echo '=== PREBUILD FOLDER STRUCTURE'
ls -1

echo "Cordova_platform is set to : $Cordova_platform"

echo "=== Detected Environmental Variable Cordova_platform is set : $Cordova_platform"
cordova build $Cordova_platform

if [ -z ${PLATFORM+x} ]; then
  echo '=== Detected Environmental Variable PLATFORM is set : $PLATFORM'
  cordova build $PLATFORM
else
  echo '=== Can Not Detected Environmental Variable PLATFORM. cordova prepare both ios and android. PLATFORM: $PLATFORM'
  cordova build ios
fi

echo '=== SEE FOLDER STRUCTURE'
ls -1

echo 'Unload rvm'
__rvm_unload

echo '=== Navigate to tests folder'
cd /Users/buddybuild/workspace/test/appium-cucumber

echo '=== bundler'
echo password | sudo -S gem install bundler

echo '=== install ruby gems'
bundle install --path=vendor

echo '=== install chromedriver'
brew install chromedriver

echo '=== install freetds'
brew install freetds
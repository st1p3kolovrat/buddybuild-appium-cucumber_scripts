#!/usr/bin/env bash

cd /Users/buddybuild/workspace

echo '=== FOLDER LISTING POST BUILD'
ls -1

echo '=== SEE WHAT IS IN WWW, SHOULD HAVE STUFF!'
cd www
ls -1

echo '=== SEE IF PLATFORMS IS PROPERLY STUFFED'
cd platforms/android/assets
ls -1

cd www
ls -1

echo '=== Navigate to tests folder'
cd /Users/buddybuild/workspace/YOUR_TEST_FOLDER

echo '=== Install cucumber'
echo password | sudo -S gem install cucumber
echo password | sudo -S gem install rake

echo '=== Install appium 1.4.16'
npm install -g appium@1.4.16

echo '=== Install selenium-webdriver'
npm install wd

echo '=== Authorize simulator access'
echo password | sudo -S authorize_ios

echo '=== First start appium server, then start your cucumber tests, if one test has failed show exit 1 and mark build as failed'
nohup appium --native-instruments-lib -lt 999999 &
sleep 15 && bundle exec rake; pkill -f appium

echo '=== Upload results to s3'
aws s3 sync ./results s3://YOUR_BUCKET_NAME/AppiumResults/$BUDDYBUILD_BUILD_NUMBER/

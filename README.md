# buddybuild-appium-cucumber_scripts

In order to have your Appium/Cucumber test automation beauty up&running continuously on buddybuild, you should set up two files:

1. **buddybuild_prebuild.sh**
2. **buddybuild_postbuild.sh**

More info about the whole process can be found here: https://blogapplyquality.com/2016/05/19/appiumcucumber-tests-uprunning-on-buddybuild/ 

How to download locally cucumber test result file with AWS? 

Please open up the terminal and paste these two commands:

1. `aws s3 ls s3://YOUR_BUCKET_NAME/AppiumResults/`
2. `aws s3 sync s3://YOUR_BUCKET_NAME/ /Users/stipekolovrat/Documents/YOUR_WORKING_FOLDER/AppiumResults`







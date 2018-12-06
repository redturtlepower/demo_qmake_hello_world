mkdir build-ios
cd build-ios
~/Qt5.11.2/5.11.2/ios/bin/qmake ./../helloworld.pro -spec macx-ios-clang CONFIG+=x86_64 CONFIG+=release
make

PRODUCT_BUNDLE_ID=com.rusche.helloworld
# Change some variables needed for app signing:
# PRODUCT_BUNDLE_IDENTIFIER
# which can be found inside helloworld.xcodeproj/project.pbxproj
# Replace 
# PRODUCT_BUNDLE_IDENTIFIER = "com.yourcompany.${PRODUCT_NAME:rfc1034identifier}";
# with "com.rusche.helloworld":
cd helloworld.xcodeproj
sed -i -e 's/PRODUCT_BUNDLE_IDENTIFIER = "com.yourcompany.${PRODUCT_NAME:rfc1034identifier}";/PRODUCT_BUNDLE_IDENTIFIER = "'"${PRODUCT_BUNDLE_ID}"'";/g' project.pbxproj
cd ..

xcodebuild -list -project helloworld.xcodeproj
scheme=helloworld
xcodebuild -scheme ${scheme} build -allowProvisioningUpdates

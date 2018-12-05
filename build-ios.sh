mkdir build-ios
cd build-ios
~/Qt5.11.2/5.11.2/ios/bin/qmake ./../helloworld.pro -spec macx-ios-clang CONFIG+=x86_64 CONFIG+=release
make

xcodebuild -list -project helloworld.xcodeproj
scheme=helloworld
xcodebuild -scheme ${scheme} build -allowProvisioningUpdates

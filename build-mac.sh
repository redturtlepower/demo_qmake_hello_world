mkdir build-mac
cd build-mac
~/Qt5.11.2/5.11.2/clang_64/bin/qmake ./../helloworld.pro -spec macx-clang CONFIG+=x86_64 CONFIG+=release
make

# This actually seems not necessary to create helloworld.app on the mac...
#xcodebuild -list -project helloworld.xcodeproj
#scheme=helloworld
#xcodebuild -scheme ${scheme} build 

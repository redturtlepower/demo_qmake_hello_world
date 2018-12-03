mkdir build
cd build
~/Qt5.11.2/5.11.2/ios/bin/qmake ./../helloworld.pro -spec macx-ios-clang CONFIG+=x86_64 CONFIG+=release
make


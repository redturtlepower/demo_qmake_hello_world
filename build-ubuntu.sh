mkdir build
cd build
~/Qt5.11.2/5.11.2/clang_64/bin/qmake ./../helloworld.pro -spec macx-clang CONFIG+=x86_64 CONFIG+=release
make


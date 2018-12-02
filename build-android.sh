mkdir build
cd build
~/Qt5.11.2/5.11.2/gcc_64/bin/qmake ./../helloworld.pro -spec android-g++ CONFIG+=x86_64 CONFIG+=release
make


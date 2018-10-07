mkdir build
cd build
qmake ./../helloworld.pro -spec=macx-clang CONFIG+=release
make


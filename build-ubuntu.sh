mkdir build
cd build
~/Qt/5.11.2/gcc_64/bin/qmake ./../helloworld.pro -spec linux-gcc CONFIG+=x86_64 CONFIG+=release
make


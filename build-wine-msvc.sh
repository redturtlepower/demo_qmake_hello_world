mkdir build
cd build
wine ~/.wine/drive_c/buildenv/deps/qt-511/bin/qmake.exe ./../helloworld.pro -spec win32-msvc CONFIG+=x86_64 CONFIG+=release
wine make
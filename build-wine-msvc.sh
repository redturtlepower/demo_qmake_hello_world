mkdir build
cd build
WINEPATH="/home/jenkins/.wine/drive_c/buildenv/deps/qt-511;/home/jenkins/.wine/drive_c/buildenv/deps/qt-511/bin;/home/jenkins/.wine/drive_c/buildenv/deps/qt-511/lib;/home/jenkins/.wine/drive_c/buildenv/deps/msvc14/bin;/home/jenkins/.wine/drive_c/buildenv/deps/msvc14/lib;/home/jenkins/.wine/drive_c/buildenv/deps/windows-kits/8.1/Include/shared;/home/jenkins/.wine/drive_c/buildenv/deps/windows-kits/8.1/Include/um;" wine qmake.exe ./../helloworld.pro -spec win32-msvc CONFIG+=x86_64 CONFIG+=release
wine make
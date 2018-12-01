mkdir build
cd build
# WINEPATH="/home/jenkins/.wine/drive_c/buildenv/deps/qt-511;/home/jenkins/.wine/drive_c/buildenv/deps/qt-511/bin;/home/jenkins/.wine/drive_c/buildenv/deps/qt-511/lib;/home/jenkins/.wine/drive_c/buildenv/deps/msvc14/bin;/home/jenkins/.wine/drive_c/buildenv/deps/msvc14/lib;/home/jenkins/.wine/drive_c/buildenv/deps/windows-kits/8.1/Include/shared;/home/jenkins/.wine/drive_c/buildenv/deps/windows-kits/8.1/Include/um;" wine qmake.exe ./../helloworld.pro -spec win32-msvc CONFIG+=x86_64 CONFIG+=release
_winepath_="C:/buildenv/deps/qt-511;C:/buildenv/deps/qt-511/bin;C:/buildenv/deps/qt-511/lib;C:/buildenv/deps/msvc14/bin;C:/buildenv/deps/msvc14/lib;C:/buildenv/deps/windows-kits/8.1/Include/shared;C:/buildenv/deps/windows-kits/8.1/Include/um;"
WINEPATH=${_winepath_} wine qmake.exe ./../helloworld.pro -spec win32-msvc CONFIG+=x86_64 CONFIG+=release "QMAKE_CXXFLAGS*=-IC:/buildenv/deps/msvc14/include" "QMAKE_CXXFLAGS*=-IC:/buildenv/deps/windows-kits/10/Include/10.0.10240.0/ucrt" "QMAKE_LFLAGS*=C:/buildenv/deps/msvc14/lib/msvcprt.lib" "QMAKE_LFLAGS*=C:/buildenv/deps/msvc14/lib/MSVCRT.lib" "QMAKE_LFLAGS*=C:/buildenv/deps/msvc14/lib/OLDNAMES.lib" "QMAKE_LFLAGS*=C:/buildenv/deps/windows-kits/8.1/Lib/winv6.3/um/x86/kernel32.lib" "QMAKE_LFLAGS*=C:/buildenv/deps/msvc14/lib/vcruntime.lib" "QMAKE_LFLAGS*=C:/buildenv/deps/windows-kits/10/Lib/10.0.10240.0/ucrt/x86/ucrt.lib"
WINEPATH=${_winepath_} wine nmake.exe

# If you want to get inside wine console:
# 1: WINEPATH=${_winepath_} wine cmd
# 2: cd build
# 3: Enter long command from above starting at 'qmake.exe'
mkdir build
cd build

DEPS=C:\\buildenv_windows\\deps
QT_DIR=$DEPS\\qt5125
QT_BIN=$DEPS\\qt5125\\msvc2017_64\\bin
QT_LIB=$DEPS\\qt5125\\msvc2017_64\\lib
MSVC_BIN=$DEPS\\msvc15\\bin
MSVC_LIB=$DEPS\\msvc15\\lib
MSVC_KITS_INCL=$DEPS\\windows-kits\\10\\Include
SDKVER=10.0.17763.0
MSVC_KITS_INCL_CPPWINRT=$MSVC_KITS_INLC\\$SDKVER\\cppwinrt
MSVC_KITS_INCL_SHARED=$MSVC_KITS_INLC\\$SDKVER\\shared
MSVC_KITS_INCL_UCRT=$MSVC_KITS_INLC\\$SDKVER\\ucrt
MSVC_KITS_INCL_UM=$MSVC_KITS_INLC\\$SDKVER\\um
MSVC_KITS_INCL_WINRT=$MSVC_KITS_INLC\\$SDKVER\\winrt
MSVC_KITS_BIN=$DEPS\\windows-kits\\10\\bin
MSVC_KITS_BIN_ARM=$MSVC_KITS_BIN\\$SDKVER\\arm
MSVC_KITS_BIN_ARM64=$MSVC_KITS_BIN\\$SDKVER\\arm64
MSVC_KITS_BIN_X64=$MSVC_KITS_BIN\\$SDKVER\\x64
MSVC_KITS_BIN_X86=$MSVC_KITS_BIN\\$SDKVER\\x86

WINEPREFIX=""
wp_QT_BIN=$(winepath -w $QT_BIN)
wp_QT_LIB=$(winepath -w $QT_LIB)
wp_MSVC_BIN=$(winepath -w $MSVC_BIN)
wp_MSVC_LIB=$(winepath -w $MSVC_LIB)

_winepath_="${QT_BIN};${QT_LIB};${MSVC_BIN};${MSVC_LIB}"

WINEPATH="${_winepath_}" wine cmd
#WINEPATH="${_winepath_}" wine qmake.exe .\\helloworld.pro -spec win32-msvc CONFIG+=x86_64 CONFIG+=release
#echo $WINEPATH
#WINEPATH=${_winepath_} wine qmake.exe .\\..\\helloworld.pro -spec win32-msvc CONFIG+=x86_64 CONFIG+=release "QMAKE_CXXFLAGS*=-IC:\\buildenv_windows\\deps\\msvc14\\include" "QMAKE_CXXFLAGS*=-IC:\\buildenv_windows\\deps\\windows-kits\\10\\Include\\10.0.10240.0\\ucrt" "QMAKE_LFLAGS*=C:\\buildenv_windows\\deps\\msvc14\\lib\\msvcprt.lib" "QMAKE_LFLAGS*=C:\\buildenv_windows\\deps\\msvc14\\lib\\MSVCRT.lib" "QMAKE_LFLAGS*=C:\\buildenv_windows\\deps\\msvc14\\lib\\OLDNAMES.lib" "QMAKE_LFLAGS*=C:\\buildenv_windows\\deps\\windows-kits\\8.1\\Lib\\winv6.3\\um\\x86\\kernel32.lib" "QMAKE_LFLAGS*=C:\\buildenv_windows\\deps\\msvc14\\lib\\vcruntime.lib" "QMAKE_LFLAGS*=C:\\buildenv_windows\\deps\\windows-kits\\10\\Lib\\10.0.10240.0\\ucrt\\x86\\ucrt.lib"
#WINEPATH=${_winepath_} wine nmake.exe

# If you want to get inside wine console:
# 1: WINEPATH=${_winepath_} wine cmd
# 2: cd build
# 3: Enter long command from above starting at 'qmake.exe'

#!/bin/bash
set -e
rm -rf build.and-armeabi
mkdir -p build.and-armeabi
cd build.and-armeabi
HOST=aarch64-linux-android
NDK_STANDALONE_TOOLCHAIN=/Volumes/cycript/android-toolchain/bin
export PATH="$NDK_STANDALONE_TOOLCHAIN/bin:$PATH"
export CC=$NDK_STANDALONE_TOOLCHAIN/clang
export CXX=$NDK_STANDALONE_TOOLCHAIN/clang++
export AR=$NDK_STANDALONE_TOOLCHAIN/$HOST-ar
export RANLIB=$NDK_STANDALONE_TOOLCHAIN/$HOST-ranlib
export LDFLAGS+="-L../ncurses.and/lib -L../readline.and -L../libffi.and/.libs"
export CFLAGS+="-I../ncurses.and/include -I../readline.and -I../libffi.and/include"
export CPPFLAGS+="-I../ncurses.and/include -I../readline.and -I../libffi.and/include"
../configure --host="$HOST" --enable-maintainer-mode BISON=/usr/local/opt/bison/bin/bison "$@"
make LIBTOOLFLAGS="--tag CXX"

#!/bin/bash
rm -rf ncurses.and
mkdir ncurses.and
cd ncurses.and
HOST=aarch64-linux-android
NDK_STANDALONE_TOOLCHAIN=/Volumes/cycript/android-toolchain/bin
export PATH="$NDK_STANDALONE_TOOLCHAIN/bin:$PATH"
export CC=$NDK_STANDALONE_TOOLCHAIN/clang
export CXX=$NDK_STANDALONE_TOOLCHAIN/clang++
export AR=$NDK_STANDALONE_TOOLCHAIN/$HOST-ar
export RANLIB=$NDK_STANDALONE_TOOLCHAIN/$HOST-ranlib
../ncurses-6.0/configure --host="$HOST" --disable-shared --enable-static --without-progs --without-tests
make
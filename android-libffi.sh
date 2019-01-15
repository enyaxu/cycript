#!/bin/bash
set -e
rm -rf libffi.and
mkdir -p libffi.and
cd libffi.and
HOST=aarch64-linux-android
NDK_STANDALONE_TOOLCHAIN=/Volumes/cycript/android-toolchain/bin
export PATH="$NDK_STANDALONE_TOOLCHAIN/bin:$PATH"
export CC=$NDK_STANDALONE_TOOLCHAIN/clang
export CXX=$NDK_STANDALONE_TOOLCHAIN/clang++
export AR=$NDK_STANDALONE_TOOLCHAIN/$HOST-ar
export RANLIB=$NDK_STANDALONE_TOOLCHAIN/$HOST-ranlib
../libffi/configure --enable-static --disable-shared --host="$HOST"
make

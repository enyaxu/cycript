#!/bin/bash
set -e
rm -rf readline.and
mkdir -p readline.and
cd readline.and
HOST=aarch64-linux-android
NDK_STANDALONE_TOOLCHAIN=/Volumes/cycript/android-toolchain/bin
export PATH="$NDK_STANDALONE_TOOLCHAIN/bin:$PATH"
export CC=$NDK_STANDALONE_TOOLCHAIN/clang
export CXX=$NDK_STANDALONE_TOOLCHAIN/clang++
export AR=$NDK_STANDALONE_TOOLCHAIN/$HOST-ar
export RANLIB=$NDK_STANDALONE_TOOLCHAIN/$HOST-ranlib
../readline/configure bash_cv_wcwidth_broken=no --host="$HOST" --disable-shared --enable-static
make
ln -sf . readline

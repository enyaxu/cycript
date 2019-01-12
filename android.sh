#!/bin/bash
ndk=${ANDROID_SDK_ROOT}/ndk-bundle
abi=armeabi-v7a
ver=4.9
api=16
bld=darwin-x86_64
bin=${ndk}/toolchains/arm-linux-androideabi-${ver}/prebuilt/${bld}/bin
#export PATH=${bin}:$PATH
flg=()
flg+=(-isysroot=${ndk}/platforms/android-${api}/arch-arm)
flg+=(-I${ndk}/sources/cxx-stl/llvm-libc++/include)
# flg+=(-I${ndk}/sources/cxx-stl/llvm-libc++/libs/${abi}/include)
ldf=()
ldf+=(-L${ndk}/sources/cxx-stl/llvm-libc++/libs/${abi})
ldf+=(-lgnustl_static)
ldf+=(-v)
tgt=arm-linux-androideabi
cc=${bin}/${tgt}-gcc
cxx=${bin}/${tgt}-g++
cpp=()
ccf=()
ccf+=(-g0 -O3)
function cfg() {
    cfg=$1
    shift
    "${cfg}" \
        CC="${cc} ${flg[*]}" CXX="${cxx} ${flg[*]}" OBJCXX="${cxx} ${flg[*]}" \
        CFLAGS="${ccf[*]}" CXXFLAGS="${ccf[*]}" OBJCXXFLAGS="${ccf[*]}" \
        --host="${tgt}" CPPFLAGS="${cpp[*]}" LDFLAGS="${ldf[*]}" "$@"
}

#!/bin/bash
PREFIX=$HOME/gameEngine/libav-0.8.1/myAndroid
NDK=~/android-ndk-r8
PLATFORM=$NDK/mytool
PREBUILD=$NDK/mytool
function build_one
{
./configure --target-os=linux \
    --enable-cross-compile \
    --arch=arm \
    --extra-libs="-lgcc" \
    --prefix=$PREFIX  \
    --disable-yasm \
    --sysroot=$PLATFORM/sysroot \
    --enable-version3 \
    --enable-gpl \
    --enable-shared \
    --disable-everything \
    --disable-ffmpeg \
    --disable-avplay \
    --disable-avprobe \
    --disable-avdevice \
    --disable-decoders \
    --disable-encoders \
    --disable-muxers \
    --disable-demuxers \
    --disable-parsers \
    --enable-encoder=mpeg4 \
    --disable-doc \
    --disable-avconv \
    --disable-ffmpeg \
    --disable-avserver \
    --disable-avfilter \
    --disable-swscale \
    --disable-devices \
    --disable-protocols \
    --enable-protocol=file \
    --disable-network \
    --cc=$PREBUILD/bin/arm-linux-androideabi-gcc \
    --cross-prefix=$PREBUILD/bin/arm-linux-androideabi- \
    --nm=$PREBUILD/bin/arm-linux-androideabi-nm \
    --extra-cflags=" -fPIC -DANDROID " \
    --disable-asm \
    --extra-ldflags="-Wl,-rpath-link=$PLATFORM/lib -L $PLATFORM/lib -nostdlib -lc -lm -ldl -llog" \
    --cpu=armv6

}
build_one

#make clean
#make -j4 install
#
#$PREBUILD/bin/arm-linux-androideabi-ar d libavcodec/libavcodec.a inverse.o
#
#$PREBUILD/bin/arm-linux-androideabi-ld -rpath-link=$PLATFORM/sysroot/usr/lib -L$PLATFORM/sysroot/usr/lib  -soname libffmpeg.so -shared -nostdlib  -z,noexecstack -Bsymbolic --whole-archive --no-undefined -o $PREFIX/libffmpeg.so libavcodec/libavcodec.a libavformat/libavformat.a libavutil/libavutil.a  -lc -lm -lz -ldl -llog  --warn-once  --dynamic-linker=/system/bin/linker $PREBUILD/lib/gcc/arm-linux-androideabi/4.4.3/libgcc.a

set -x
export CPPFLAGS="${CPP_FLAGS} -I$PREFIX/include "

# Get an updated config.sub and config.guess needed for aarch64
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

# disable server components
./configure \
    --prefix=$PREFIX  \
    --disable-slapd \
    --disable-slurpd \
    --host=${HOST} \
    --build=${BUILD} || { cat config.log; exit 1; }
make
make install

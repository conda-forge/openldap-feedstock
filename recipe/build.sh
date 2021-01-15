# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build
cp $BUILD_PREFIX/share/gnuconfig/config.* ./contrib/ldapc++
set -x
# export CPPFLAGS="${CPPFLAGS} -isystem $PREFIX/include "

# disable server components
./configure \
    --prefix=$PREFIX  \
    --disable-slapd \
    --disable-slurpd \
    --with-yielding_select=yes || { cat config.log; exit 1; }

sed -i.bak 's|#define NEED_MEMCMP_REPLACEMENT 1|/* #undef NEED_MEMCMP_REPLACEMENT */|' include/portable.h

make -j${CPU_COUNT}
make install

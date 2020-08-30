set -x
export CPPFLAGS="${CPPFLAGS} -isystem $PREFIX/include "

# disable server components
./configure \
    --prefix=$PREFIX  \
    --disable-slapd \
    --disable-slurpd || { cat config.log; exit 1; }
make -j${CPU_COUNT}
make install

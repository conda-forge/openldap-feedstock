set -x
export CPPFLAGS="${CPP_FLAGS} -I$PREFIX/include "

# disable server components
./configure \
    --prefix=$PREFIX  \
    --disable-slapd \
    --disable-slurpd || { cat config.log; exit 1; }
make
make install

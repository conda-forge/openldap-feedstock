set -x
export CPPFLAGS="${CPP_FLAGS} -I$PREFIX/include "
echo $HOST
echo $BUILD
# disable server components
./configure \
    --prefix=$PREFIX  \
    --disable-slapd \
    --disable-slurpd \
    --host=$HOST \
    --build=$BUILD || { cat config.log; exit 1; }
make
make install

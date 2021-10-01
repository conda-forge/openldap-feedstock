# Get an updated config.sub and config.guess
cp %BUILD_PREFIX%\share\gnuconfig\config.* build
cp %BUILD_PREFIX%\share\gnuconfig\config.* contrib\ldapc++


set ac_cv_func_memcmp_working=yes

# disable server components
./configure \
    --prefix=%LIBRARY_PREFIX%  \
    --disable-slapd \
    --disable-slurpd \
    --with-yielding_select=yes
make
make install

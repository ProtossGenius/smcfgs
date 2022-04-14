cd /tmp
rm -rf autoconf*
wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz
tar zxvf autoconf-latest.tar.gz
rm autoconf-latest.tar.gz
mv autoconf* autoconf
cd autoconf
./configure --prefix=/usr/local/
make -j$(nproc) && sudo make install

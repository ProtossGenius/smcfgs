wget http://download.savannah.gnu.org/releases/lzip/lzip-1.16.tar.gz
tar -zxvf lzip-1.16.tar.gz
cd lzip-1.16
./configure
make && make install
cd /tmp/
rm -rf lzip-1.16*

cd /tmp/
smwget 941a8674ea2eeb33f5c30ecf08124874 gcc-10.2.0.tar.gz http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-10.2.0/gcc-10.2.0.tar.gz
#wget https://ftp.gnu.org/gnu/gcc/gcc-6.3.0/gcc-6.3.0.tar.bz2
tar zxvf  gcc-10.2.0.tar.gz 
cd gcc-10.2.0
./contrib/download_prerequisites
mkdir build
cd build
scl enable devtoolset-7 "../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib"
scl enable devtoolset-7 "make"
make install

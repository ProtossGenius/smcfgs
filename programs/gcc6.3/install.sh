cd /tmp/
scl enable devtoolset-7 bash
source /opt/rh/devtoolset-7/enable
smwget 677a7623c7ef6ab99881bc4e048debb6  gcc-6.3.0.tar.bz2 https://mirrors.ustc.edu.cn/gnu/gcc/gcc-6.3.0/gcc-6.3.0.tar.bz2 
#wget https://ftp.gnu.org/gnu/gcc/gcc-6.3.0/gcc-6.3.0.tar.bz2
tar -jxvf gcc-6.3.0.tar.bz2 
cd gcc-6.3.0/
./contrib/download_prerequisites
mkdir build
cd build
../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
make && make install
ln -s /usr/local/lib64/libstdc++.so.6.0.22 /lib64/libstdc++.so.6

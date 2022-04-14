cd /tmp
rm -rf m4*
wget http://mirrors.kernel.org/gnu/m4/m4-latest.tar.gz
tar -zxvf m4-latest.tar.gz
rm m4-latest.tar.gz
mv m4-*  m4
cd m4
ls
./configure --prefix=/usr/local/
make -j$(nproc) && sudo make install

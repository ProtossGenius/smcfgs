cd /tmp
rm -rf automake*
wget http://mirrors.kernel.org/gnu/automake/automake-1.16.5.tar.gz
tar zxvf automake-1.16.5.tar.gz
rm automake-*.tar.gz
mv automake* automake
cd automake
./configure --prefix=/usr/local/
make -j$(nproc) && sudo make install

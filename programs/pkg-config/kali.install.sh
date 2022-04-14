cd /tmp
rm -rf pkg-config*
wget https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
tar -zxvf pkg-config-0.29.2.tar.gz
rm pkg-config-*.tar.gz
mv pkg-config* pkg-config
cd pkg-config
./configure --prefix=/usr/local/ --with-internal-glib
make -j$(nproc) && make check && sudo make install

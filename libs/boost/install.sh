cd /tmp/ 
# you can call [smcfg -install libs/boost/download] before this.
smwget 4036cd27ef7548b8d29c30ea10956196 boost_1_73_0.tar.gz  https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz
tar -zxvf boost_1_73_0.tar.gz
cd boost_1_73_0
./bootstrap.sh --with-libraries=all --with-toolset=gcc
./b2 install --prefix=/usr
ldconfig

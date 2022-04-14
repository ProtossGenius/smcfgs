sudo apt-get remove openssl
cd /tmp && curl https://www.openssl.org/source/openssl-3.0.2.tar.gz  | tar xz && cd openssl-3.0.2 && sudo ./config && sudo make -j24 && sudo make install

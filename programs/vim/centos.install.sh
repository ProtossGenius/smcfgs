cd $sm_programs && git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu
make && make install



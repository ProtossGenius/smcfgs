cd /tmp && git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes 
make && make install



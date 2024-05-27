cd /tmp && git clone https://github.com/vim/vim.git --depth 1
cd vim/src
./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes 
make -j24 && sudo make install



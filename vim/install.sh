cd $sm_programs && git clone https://github.com/vim/vim.git
cd vim/src
./configure --prefix=/usr/local
make && make install



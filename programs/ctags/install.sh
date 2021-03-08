cd /tmp
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure --prefix=/usr # defaults to /usr/local
make -j8
sudo make install # may require extra privileges depending on where to install

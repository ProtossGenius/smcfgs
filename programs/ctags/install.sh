cd /tmp
git clone https://github.com/universal-ctags/ctags.git --depth 1
cd ctags
./autogen.sh
./configure  # defaults to /usr/local
make -j8
sudo make install # may require extra privileges depending on where to install

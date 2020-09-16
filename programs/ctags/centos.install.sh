set -e
cd /tmp
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar zxvf ctags-5.8.tar.gz
cd ctags-5.8
./configure && make && make install
rm -rf /tmp/ctags-5.8*

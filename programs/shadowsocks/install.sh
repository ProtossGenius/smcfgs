source ~/.profile

# install shadowsocks-rust
#bash
sudo apt install build-essential
cargo install shadowsocks-rust

# install obfs

sudo apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake autoconf pkg-config m4 xmlto libev-dev 
git clone https://github.com/shadowsocks/simple-obfs.git
pip3 install asciidoc
cd simple-obfs
git submodule update --init --recursive
./autogen.sh
./configure && make -j$(nproc)
sudo make install


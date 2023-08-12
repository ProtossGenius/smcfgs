# install cargo

curl https://sh.rustup.rs -sSf | sh

# init cargo env in any env file .profile/.base_profile/...
# set CARGO_HOME for cargo env
# set target-cpu=native feature to let rustc generate and optimize code for the CPU running the compiler.
echo 'CARGO_HOME=/root/cargo' >> ~/.profile
echo 'RUSTFLAGS="-C target-cpu=native"' >> ~/.profile
source ~/.profile

# install shadowsocks-rust
#bash
sudo apt install build-essential
cargo install shadowsocks-rust

# install obfs

sudo apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake
git clone https://github.com/shadowsocks/simple-obfs.git
pip3 install asciidoc
cd simple-obfs
git submodule update --init --recursive
./autogen.sh
./configure && make -j$(nproc)
sudo make install


cd /tmp && git clone https://github.com/google/protobuf.git
cd protobuf/
git submodule update --init --recursive
 ./autogen.sh
./configure
make -j16
#make check
sudo make install
ldconfig
go get -u google.golang.org/protobuf/cmd/protoc-gen-go

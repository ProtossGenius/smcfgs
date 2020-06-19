cd /tmp/ && git clone https://github.com/google/protobuf.git
cd protobuf/
git submodule update --init --recursive
 ./autogen.sh
./configure
make 
#make check
make install
ldconfig
go get -u google.golang.org/protobuf/cmd/protoc-gen-go

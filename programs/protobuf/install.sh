cd $sm_programs/ && git clone https://github.com/google/protobuf.git
cd protobuf/
git submodule update --init --recursive
 ./autogen.sh
./configure
make 
#make check
sudo make install
ldconfig
go get -u google.golang.org/protobuf/cmd/protoc-gen-go

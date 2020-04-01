cd $sm_programs/ && git clone https://github.com/google/protobuf.git
cd protobuf/
git submodule update --init --recursive
 ./autogen.sh
./configure
make 
#make check
make install
ldconfig
go get -u github.com/golang/protobuf/protoc-gen-go

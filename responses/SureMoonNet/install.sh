cd $GOPATH/src/github.com/ProtossGenius 
go get -u github.com/golang/protobuf/protoc-gen-go
git clone git@github.com:ProtossGenius/SureMoonNet.git
cd SureMoonNet && make install

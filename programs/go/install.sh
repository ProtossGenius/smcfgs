
cd /data/programs/ 
wget https://studygolang.com/dl/golang/go1.14.1.linux-amd64.tar.gz
tar -xzf go1.14.1.linux-amd64.tar.gz
cp ~/.smcfg/programs/go/go.sh /tmp/go.sh
sudo mv /tmp/go.sh  /etc/profile.d/go.sh
export GOROOT=/data/programs/go
export GOPATH=/data/workspace/go 
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct

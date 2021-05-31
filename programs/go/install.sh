cd /tmp/
smwget 8c5a7503e4e5589aa9b95936ca5d8543 go.tar.gz https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz
tar -xzf go.tar.gz
sudo mv go /opt/go
cp ~/.smcfg/programs/go/go.sh /tmp/go.sh
sudo mv /tmp/go.sh  /etc/profile.d/go.sh
export GOROOT=/opt/go
export GOPATH=~/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct

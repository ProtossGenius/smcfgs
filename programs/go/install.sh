cd /tmp/
#wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz
tar -xzf go1.16.4.linux-amd64.tar.gz
sudo mv go /opt/go
cp ~/.smcfg/programs/go/go.sh /tmp/go.sh
sudo mv /tmp/go.sh  /etc/profile.d/go.sh
export GOROOT=/opt/go
export GOPATH=~/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct

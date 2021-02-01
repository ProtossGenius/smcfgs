
cd /data/programs/ 
#wget https://studygolang.com/dl/golang/go1.14.1.linux-amd64.tar.gz
tar -xzf go1.14.1.linux-amd64.tar.gz
sudo cp ~/.smcfg/programs/go/go.sh  /etc/profile.d/go.sh
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct

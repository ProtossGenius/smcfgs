cd /tmp/

https://golang.google.cn/dl/go1.22.3.linux-amd64.tar.gz 
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin 
cp ~/.smcfg/programs/go/go.sh /tmp/go.sh
sudo mv /tmp/go.sh  /etc/profile.d/go.sh
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct

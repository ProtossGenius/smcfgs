source /etc/profile.d/sm_base_dir.sh
cd $sm_programs && wget https://studygolang.com/dl/golang/go1.14.1.linux-amd64.tar.gz
tar -xzvf go1.14.1.linux-amd64.tar.gz
cp ~/.smcfg/programs/go/go.sh  /etc/profile.d/go.sh
source /etc/profile.d/go.sh
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct

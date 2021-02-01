sudo mkdir /data
sudo chmod -R 777 /data
mkdir /data/programs
export sm_programs=/data/programs
export sm_data=/data
echo "export sm_data=/data" > /tmp/sm_base_dir.sh
export sm_programs=/data/programs
echo "export sm_programs=/data/programs" >> /tmp/sm_base_dir.sh
export sm_workspace=/data/workspace
echo "export sm_workspace=/data/workspace" >> /tmp/sm_base_dir.sh
sudo cp /tmp/sm_base_dir.sh /etc/profile.d/
sh ./programs/go/install.sh
export GOROOT=/data/programs/go
export GOPATH=/data/workspace/go 
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
go get -u github.com/ProtossGenius/smntools/cmd/smcfg

echo "you should call this command by yourself"
echo "source /etc/profile.d/*.sh"
#smcfg -install responses
#smcfg -install configs/vim



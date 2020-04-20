mkdir /data
mkdir /data/programs
export sm_programs=/data/programs
echo "export sm_data=/data" > /etc/profile.d/sm_base_dir.sh
echo "export sm_programs=/data/programs" >> /etc/profile.d/sm_base_dir.sh
echo "export sm_workspace=/data/workspace" >> /etc/profile.d/sm_base_dir.sh
source /etc/profile.d/sm_base_dir.sh

sh ./programs/go/install.sh
go get -u github.com/ProtossGenius/smntools/cmd/smcfg
smcfg -install responses
smcfg -install programs/configs/vim


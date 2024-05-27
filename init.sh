mkdir -p ~/data/programs
sh ./programs/go/install.sh
export PATH=$PATH:/usr/local/go/bin 
go install github.com/ProtossGenius/smntools/cmd/smcfg@latest
smcfg -install configs/vim 
echo "you should call this command by yourself"
echo "source /etc/profile.d/go.sh"
#smcfg -install responses
#smcfg -install configs/vim



sh ./data/install.sh
sh ./data/programs/install.sh
sh ./programs/go/install.sh
go get -u github.com/ProtossGenius/smntools/cmd/smcfg
smcfg -install responses
smcfg -install programs/vim/config


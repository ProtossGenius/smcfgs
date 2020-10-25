pip3 install shadowsocks
cp cfg.json /etc/shadowsocks.cfg.json
ssclient -c /etc/shadowsocks.cfg.json -d start
go get -u github.com/ProtossGenius/kcptun/cmd/kcptun-client 



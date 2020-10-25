pip3 install shadowsocks
cp cfg.json /etc/shadowsocks.cfg.json
ssserver -c /etc/shadowsocks.cfg.json -d start
go get -u github.com/ProtossGenius/kcptun/cmd/kcptun-server
nohup kcptun-server -l :7522 -t "127.0.0.1:7522" -dscp 46 -key srj7758521.  -mtu 1400 -sndwnd 256 -rcvwnd 2048 -mode fast2 -crypt=aes -keepalive=10     > /root/kcptun.log 2>&1 &

firewall-cmd --permanent --add-port=7522/udp
firewall-cmd --reload


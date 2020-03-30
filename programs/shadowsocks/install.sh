pip3 install shadowsocks
cp cfg.json /etc/shadowsocks.cfg.json
ssserver -c /etc/shadowsocks.cfg.json -d start

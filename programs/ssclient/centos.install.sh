sudo pip3 install shadowsocks
sudo cp clt.json /etc/ss.clt.json
cp ~/.smcfg/programs/ssclient/fq.sh ~/fq.sh
go install github.com/ProtossGenius/kcptun/cmd/kcptun-client@latest
sudo sed -i 's/cleanup/reset/g' /usr/local/lib/python3.6/site-packages/shadowsocks/crypto/openssl.py

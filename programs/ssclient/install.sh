sudo pip3 install shadowsocks
sudo cp clt.json /etc/ss.clt.json
cp ~/.smcfg/programs/ssclient/fq.sh ~/fq.sh
go get -u github.com/ProtossGenius/kcptun/cmd/kcptun-client 
sudo sed -i 's/cleanup/reset/g' /usr/local/lib/python3.9/dist-packages/shadowsocks/crypto/openssl.py

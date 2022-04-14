pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
sudo cp clt.json /etc/ss.clt.json
cp ~/.smcfg/programs/ssclient/fq.sh ~/fq.sh
#sudo sed -i 's/cleanup/reset/g' /usr/local/lib/python3.9/dist-packages/shadowsocks/crypto/openssl.py

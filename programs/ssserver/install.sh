export SSPATH=$HOME/.smcfg/programs/ssserver/
cp $SSPATH/*.service /etc/systemd/system/
cp $SSPATH/cfg.json /etc/ss.json 
sudo systemctl daemon-reload
sudo systemctl enable shadowsocks.service 
sudo systemctl start shadowsocks.service 

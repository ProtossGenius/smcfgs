nohup kcptun-client -l :7521 -r "remote:7522" -dscp 46 -key yourpassword  -mtu 1400 -sndwnd 256 -rcvwnd 2048 -mode fast2 -crypt=aes -keepalive=10  > /dev/null 2>&1 &
sslocal -c /etc/ss.clt.json -d start
systemctl start privoxy.service 

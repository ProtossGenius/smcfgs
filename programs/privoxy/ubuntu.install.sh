sudo apt-get install privoxy -y
sudo echo "        forward-socks5t   /               127.0.0.1:1080 ." | sudo tee -a  /etc/privoxy/config

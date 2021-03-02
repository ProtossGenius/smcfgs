cd /tmp
wget https://download.redis.io/releases/redis-6.2.1.tar.gz
tar xzf redis-6.2.1.tar.gz
cd redis-6.2.1
make -j8
sudo make install
sudo mkdir /etc/redis
sudo cp redis.conf /etc/redis/

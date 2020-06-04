cd /tmp/ 
smcfg -update libs/redis6/download
tar -zxvf /tmp/redis-6.0.4.tar.gz  
cd redis-6.0.4
make && make install

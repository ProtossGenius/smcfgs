cd /tmp 
wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.26-linux-glibc2.12-x86_64.tar.gz
tar -xvf mysql-5.7.26-linux-glibc2.12-x86_64.tar.gz 
mv mysql-5.7.26-linux-glibc2.12-x86_64 /usr/local/mysql-5.7.26
groupadd mysql
useradd -r -g mysql mysql
cd /
mkdir -p data
cd data/
mkdir -p mysql
chown mysql:mysql -R /data/mysql

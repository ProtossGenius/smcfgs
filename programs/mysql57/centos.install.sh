cd /tmp/
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql57-community-release-el7-9.noarch.rpm
yum install mysql-server -y
systemctl start mysqld
systemctl enable mysqld
grep 'temporary password' /var/log/mysqld.log
echo 'now you should use the password to config mysql.'

cd /tmp   
wget https://github.com/Kitware/CMake/releases/download/v3.23.0-rc5/cmake-3.23.0-rc5.tar.gz
tar -zxvf cmake-3.23.0-rc5.tar.gz
cd cmake-3.23.0-rc5
sudo apt autoremove cmake
./bootstrap
make -j24
sudo make install

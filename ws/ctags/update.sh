cd /usr/local/include 
sudo ctags  -R --c++-kinds=+px --fields=+niazS --extra=+q --c-kinds=+px --output-format=e-ctags . 
cd /usr/include 
sudo ctags -R --c++-kinds=+px --fields=+niazS --extra=+q --c-kinds=+px --output-format=e-ctags . 


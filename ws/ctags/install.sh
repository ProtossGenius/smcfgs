cd /usr/local/include 
nohup ctags  -R --c++-kinds=+px --fields=+niazS --extra=+q --c-kinds=+px  .  &
cd /usr/include 
nohup ctags -R --c++-kinds=+px --fields=+niazS --extra=+q --c-kinds=+px  .  &


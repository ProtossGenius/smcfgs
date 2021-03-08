cd /usr/local/include 
nohup ctags  -R --c++-kinds=+px --fields=+niazS --extras=+q --c-kinds=+px  .  &
cd /usr/include 
nohup ctags -R --c++-kinds=+px --fields=+niazS --extras=+q --c-kinds=+px  .  &


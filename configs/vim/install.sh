alias fq='http_proxy=127.0.0.1:8118 https_proxy=127.0.0.1:8118 '
smcfg -install programs/ctags
cd /usr/include
ctags --fields=+niazS --extra=+q --c++-kinds=+px -R `pwd`
cd /usr/local/include
ctags --fields=+niazS --extra=+q --c++-kinds=+px -R `pwd`
sm_vim_cfg=~/.smcfg/configs/vim
sudo apt-get install clang-format -y
cp $sm_vim_cfg/.vimrc ~/
cp $sm_vim_cfg/.ctags ~/
git clone https://github.com/junegunn/vim-plug.git /tmp/vim-plug
mkdir -p ~/.vim/autoload/
cp /tmp/vim-plug/plug.vim ~/.vim/autoload/
vim +PlugInstall <$sm_vim_cfg/vimexit 
cd ~/.vim/plugged/YouCompleteMe 
git submodule update --init --recursive 
fq ./install.py --go-completer --rust-completer --clang-completer --java-completer
cp $sm_vim_cfg/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
vim +GoInstallBinaries <$sm_vim_cfg/vimexit

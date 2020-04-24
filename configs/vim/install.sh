sm_vim_cfg=~/.smcfg/configs/vim
cp $sm_vim_cfg/.vimrc ~/
git clone https://github.com/junegunn/vim-plug.git /tmp/vim-plug
mkdir -p ~/.vim/autoload/
cp /tmp/vim-plug/plug.vim ~/.vim/autoload/
vim +PlugInstall <$sm_vim_cfg/vimexit 
cd ~/.vim/plugged/YouCompleteMe 
git submodule update --init --recursive 
./install.py --gocode-completer  --clang-completer
cp $sm_vim_cfg/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
vim +GoInstallBinaries <$sm_vim_cfg/vimexit

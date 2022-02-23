vim_cfg=~/.smcfg/configs/vim/
cp $vim_cfg/.vimrc ~/.vimrc
cp $vim_cfg/.ctags ~/.ctags
cp -r $vim_cfg/UltiSnips ~/.vim
cp $vim_cfg/.clang-format ~/
vim +PlugUpdate  < $vim_cfg/vimexit
cd ~/.vim/plugged/YouCompleteMe 
git pull
git submodule update --init --recursive 
./install.py --gocode-completer  --clang-completer --java-completer
cp $vim_cfg/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
vim +GoUpdateBinaries  < $vim_cfg/vimexit 

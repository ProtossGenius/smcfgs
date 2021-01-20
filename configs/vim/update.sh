smcfg -update programs/ctags
cd /usr/include
ctags --fields=+niazS --extra=+q --c++-kinds=+px -R `pwd`
vim_cfg=~/.smcfg/configs/vim/
cp $vim_cfg/.vimrc ~/.vimrc
cp $vim_cfg/.ctags ~/.ctags
cp $vim_cfg/UltiSnips ~/.vim -r
vim +PlugUpdate  < $vim_cfg/vimexit
cp $vim_cfg/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
cd ~/.vim/plugged/YouCompleteMe 
git pull
git submodule update --init --recursive 
./install.py --gocode-completer  --clang-completer
vim +GoUpdateBinaries  < $vim_cfg/vimexit 

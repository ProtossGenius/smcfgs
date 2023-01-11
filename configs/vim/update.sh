vim_cfg=~/.smcfg/configs/vim/
alias fq='http_proxy=127.0.0.1:8118 https_proxy=127.0.0.1:8118 '
cp $vim_cfg/.vimrc ~/.vimrc
cp $vim_cfg/.ctags ~/.ctags
cp -r $vim_cfg/UltiSnips ~/.vim
cp $vim_cfg/.clang-format ~/
fq vim +PlugUpdate  < $vim_cfg/vimexit
cd ~/.vim/plugged/YouCompleteMe 
fq git pull
fq git submodule update --init --recursive 
fq ./install.py --gocode-completer  --clang-completer --java-completer
cp $vim_cfg/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
vim +GoUpdateBinaries  < $vim_cfg/vimexit 

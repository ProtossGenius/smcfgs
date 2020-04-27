vim_cfg=~/.smcfg/configs/vim/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp $vim_cfg/.vimrc ~/.vimrc
vim +PlugUpdate < $vim_cfg/vimexit 
cp $vim_cfg/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
cd ~/.vim/plugged/YouCompleteMe 
git submodule update --init --recursive 
./install.py --gocode-completer  --clang-completer
vim +GoUpdateBinareies $vim_cfg/vimexit 

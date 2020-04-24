export vim_cfg=~/.smcfg/configs/vim/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp $vim_cfg/.vimrc ~/.vimrc
cd ~/.vim/plugged/YouCompleteMe 
./install.py --gocode-completer  --clang-completer
vim +PlugUpdate < $vim_cfg/vimexit 
vim +GoUpdateBinareies $vim_cfg/vimexit 

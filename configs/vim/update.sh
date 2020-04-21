curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.smcfg/configs/vim/.vimrc ~/.vimrc
cd ~/.vim/bundle/YouCompleteMe 
./install.py --gocode-completer  --clang-completer
vim +PlugUpdate +q +q +q
vim +GoUpdateBinareies +q +q +q

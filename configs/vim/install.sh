cp ~/.smcfg/programs/vim/config/.vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall <~/.smcfg/programs/vim/config/vimexit 
cd ~/.vim/plugged/YouCompleteMe 
git submodule update --init --recursive 
./install.py --gocode-completer  --clang-completer
vim +GoInstallBinaries <~/.smcfg/programs/vim/config/vimexit

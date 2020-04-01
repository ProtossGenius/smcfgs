cp ~/.smcfg/programs/vim/config/.vimrc ~/
mkdir ~/.vim
mkdir ~/.vim/bundle
cd ~/.vim/bundle && git clone https://github.com/gmarik/Vundle.vim
vim +PluginInstall <~/.smcfg/programs/vim/config/vimexit 
cd ~/.vim/bundle/YouCompleteMe && ./install.py --gocode-completer  --clang-completer
vim +GoInstallBinaries <~/.smcfg/programs/vim/config/vimexit

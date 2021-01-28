vim_cfg=~/.smcfg/configs/vim/

cp ~/.vimrc $vim_cfg/.vimrc
cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py $vim_cfg/.ycm_extra_conf.py
cp ~/.ctags $vim_cfg/.ctags
cp ~/.vim/UltiSnips $vim_cfg -r
cp ~/.clang-format $vim_cfg/.clang-format

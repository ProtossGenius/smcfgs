set nocompatible
filetype off
syntax enable
set ts=4
set sw=4
set backspace=2
call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
call plug#end()
map <F7> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR>
imap <F6> <C-x><C-o>
nnoremap <F5>   <Esc>:w<CR>:!make 
nnoremap <F8>   <Esc>:w<CR>:!make qrun<CR>

" ale-setting {{{
" "自定义error和warning图标
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 500
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
 let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"
" "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
 nmap sp <Plug>(ale_previous_wrap)
 nmap sn <Plug>(ale_next_wrap)
" "<Leader>s触发/关闭语法检查
 nmap <Leader>s :ALEToggle<CR>
" "<Leader>d查看错误或警告的详细信息
 nmap <Leader>d :ALEDetail<CR>
" "使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
			\   'c++': ['clang'],
			\   'c': ['clang'],
			\   'python': ['pylint'],
			\	'go':['golint', 'go'],
			\}
" " }}}}

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<C-i>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
set number
"noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let mapleader = ","
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gr <Plug>(go-run)
au FileType go nmap <Leader>gb <Plug>(go-build)
au FileType go nmap <Leader>gt <Plug>(go-test)
au FileType go nmap <Leader>gdt <Plug>(go-def-split)
au FileType go nmap <Leader>gds <Plug>(go-def-split)
au FileType go nmap <Leader>gdt <Plug>(go-def-table)
au FileType go nmap <Leader>rn <Plug>(go-rename)
let g:go_fmt_command = "goimports"
filetype plugin indent on


set nocompatible

filetype off
syntax enable
set ts=4
set sw=4
set rtp+=~/.vim/bundle/Vundle.vim
set backspace=2
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
map <F7> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR>
imap <F6> <C-x><C-o>
nnoremap <F5>   <Esc>:w<CR>:!make 
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


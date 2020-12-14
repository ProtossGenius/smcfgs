set nocompatible
set encoding=utf-8
filetype off
syntax enable
set ts=4
set sw=4
set backspace=2
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-signify'
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
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/LeaderF'
call plug#end()
map <F7> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR>

" 	asyncrun 
" 自动打开 quickfix window ，高度为 6
"" let g:asyncrun_open = 6
"
" " 任务结束时候响铃提醒
"" let g:asyncrun_bell = 1
"
" " 设置 F10 打开/关闭 Quickfix 窗口
"nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"nnoremap <F5> :w<CR>:AsyncRun -mode=term -pos=tab make qrun<CR>
"nnoremap <F6> :w<CR>:AsyncRun -mode=term -pos=tab make 
"nnoremap <F8> :w<CR>:AsyncRun -mode=term -pos=tab make test<CR>
"nnoremap <F9> :w<CR>:AsyncRun -mode=term -pos=ta  make debug<CR>

nnoremap <F5> :w<CR>:!make qrun<CR>
nnoremap <F6> :w<CR>:!make 
nnoremap <F8> :w<CR>:!make test<CR>
nnoremap <F9> :w<CR>:!make debug<CR>
nnoremap <F10>   <Esc>:w<CR>g<C-g>
"----------------------------------------------------------------------
" ale
"----------------------------------------------------------------------
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1


let g:airline#extensions#ale#enabled = 1


"----------------------------------------------------------------------
" linters
"----------------------------------------------------------------------
let g:ale_linters = {
			\ 'c': ['gcc', 'cppcheck'], 
			\ 'cpp': ['gcc', 'cppcheck'], 
			\ 'python': ['flake8', 'pylint'], 
			\ 'lua': ['luac'], 
			\	'go':[ 'golint', 'go vet', 'go build', 'golangci-lint'],
			\ 'java': ['javac'],
			\ 'javascript': ['eslint'], 
			\ }


let g:ale_c_gcc_options = '-Wall -Werror -O2 -std=c99'
" when check cpp20 should add -std=c++2a -fcoroutines
let g:ale_cpp_gcc_options = '-Wall -Werror -O2'
let g:ale_cpp_cc_options = '-Wall -Werror -O2'
let g:ale_c_cppcheck_options = '--inline-suppr '
let g:ale_cpp_cppcheck_options = '--inline-suppr '

" let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']
" let g:ale_linters.lua += ['luacheck']

if executable('gcc') == 0 && executable('clang')
	let g:ale_linters.c += ['clang']
	let g:ale_linters.cpp += ['clang']
endif


" "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
 nmap sp <Plug>(ale_previous_wrap)
 nmap sn <Plug>(ale_next_wrap)

let mapleader = ","
" "<Leader>s触发/关闭语法检查
 nmap <Leader>s :ALEToggle<CR>
" "<Leader>d查看错误或警告的详细信息
 nmap <Leader>d :ALEDetail<CR>

" screen jump
let mapleader = "`"
nmap <Leader><Right> <C-w><Right>
nmap <Leader><Left> <C-w><Left>
nmap <Leader><Up> <C-w><Up>
nmap <Leader><Down> <C-w><Down>

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsListSnippets="<C-l>"
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
set tags=./.tags;,.tags
set tags+=/usr/include/tags
"vim-gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"
" " 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
"
" " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
"LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <c-l> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}



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
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

filetype plugin indent on


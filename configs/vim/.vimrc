" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 0
nnoremap <esc>^[ <esc>^[
set nocompatible
set encoding=utf-8
filetype off
syntax enable
set ts=2
set sw=2
set backspace=2
set noshowmode
set cursorcolumn  " 高亮光标列
set cursorline    " 高亮光标行
call plug#begin('~/.vim/plugged')
Plug 'voldikss/vim-translator'
" Plug 'rhysd/vim-clang-format'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go'
Plug 'Chiel92/vim-autoformat'
" Plug 'scrooloose/nerdtree'
Plug 'justinmk/vim-dirvish'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
 Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/LeaderF'
Plug 'Shougo/echodoc.vim'

Plug 'OmniSharp/omnisharp-vim'
" Mappings, code-actions available flag and statusline integration
Plug 'nickspoons/vim-sharpenup'

" Vim FZF integration, used as OmniSharp selector
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Autocompletion
Plug 'prabirshrestha/asyncomplete.vim'

" Colorscheme
Plug 'gruvbox-community/gruvbox'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'maximbaz/lightline-ale'
" Plug 'neoclide/coc.nvim'
" Snippet support
if s:using_snippets
    Plug 'sirver/ultisnips'
endif
Plug 'mattn/emmet-vim'
Plug 'ProtossGenius/leetcode.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install', 'for': ['markdown', 'vim-plug'] }

call plug#end()

imap jj <ESC>
map <F7> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR>
"   asyncrun
" 自动打开 quickfix window ，高度为 6
"" let g:asyncrun_open = 6
"
" " 任务结束时候响铃提醒
"" let g:asyncrun_bell = 1
"
" " 设置 F10 打开/关闭 Quickfix 窗口

nnoremap <F5> :wa<CR>:ter ++noclose ++curwin make qrun<CR>
nnoremap <F6> :wa<CR>:ter ++noclose ++curwin make  
nnoremap <F8> :wa<CR>:ter ++noclose ++curwin make tests<CR>
nnoremap <F9> :wa<CR>:!make debug<CR>
nnoremap <F10>   <Esc>:wa<CR>g<C-g>
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
            \ 'c': ['g++', 'cppcheck' ],
            \ 'cpp': ['g++', 'cppcheck'],
            \ 'python': ['flake8', 'pylint'],
            \ 'lua': ['luac'],
            \ 'go':['golangci-lint', 'golint', 'go vet', 'go build'],
            \ 'java': ['javac'],
            \ 'javascript': ['eslint'],
            \ }
autocmd BufNewFile,BufRead *.h set filetype=cpp
autocmd BufNewFile,BufRead *.fs set filetype=glsl
autocmd BufNewFile,BufRead *.vs set filetype=glsl
let g:ale_c_gcc_options = '-Wall -Werror -O2 -std=c99 -DNDEBUG'
" when check cpp20 should add -std=c++2a -fcoroutines
let g:ale_cpp_gcc_options = '-Wall -Werror -O2 -std=c++17 -DNDEBUG -I /usr/local/include'
let g:ale_cpp_cc_options = '-Wall -Werror -O2 -std=c++17 -DNDEBUG  -I /usr/local/include'
let g:ale_c_cppcheck_options = '--inline-suppr '
let g:ale_cpp_cppcheck_options = '--inline-suppr --enable=all'
let g:ale_go_golangci_lint_package  = 1
" let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']
" let g:ale_linters.lua += ['luacheck']

if executable('gcc') == 0 && executable('clang')
"    let g:ale_linters.c += ['clang']
"    let g:ale_linters.cpp += ['clang']
endif


" "普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

" screen jump
let mapleader = "`"
nmap <Leader><Right> <C-w><Right>
nmap <Leader><Left> <C-w><Left>
nmap <Leader><Up> <C-w><Up>
nmap <Leader><Down> <C-w><Down>
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let mapleader = ";"
let g:UltiSnipsExpandTrigger=";;"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<M-w>'
set completeopt=menu,menuone
set number
"noremap <c-z> <NOP>
set tags=./.tags;,.tags
set tags+=/usr/include/tags
set tags+=/usr/local/include/tags
"vim-gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', ".gradle"]
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
let g:gutentags_ctags_extra_args += ['--c-kinds=+px', '--output-format=e-ctags']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif


let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,css,less,lua,javascript,typescript,typescriptreact,javascriptreact': ['re!\w{2}'],
            \ }
"LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
noremap <m-f> :Leaderf rg<cr>
noremap <c-p> :Files<cr>
noremap <S-f> gF
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}



let mapleader = ""
" "<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"" do vsplit
nmap <Leader>sv :vsplit<CR>
nmap <Leader>yg :YcmCompleter GoToDefinition<CR>
nmap <Leader>ycr :YcmCompleter GoToCallers<CR>
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gr <Plug>(go-run)
au FileType go nmap <Leader>gb <Plug>(go-build)
au FileType go nmap <Leader>gt <Plug>(go-test)
au FileType go nmap <Leader>gdt <Plug>(go-def-split)
au FileType go nmap <Leader>gds <Plug>(go-def-split)
au FileType go nmap <Leader>gdt <Plug>(go-def-table)
au FileType go nmap <Leader>rn <Plug>(go-rename)
map <M-c> :Commands<CR>
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:echodoc#enable_at_startup = 1
"配置
" let g:clang_format#auto_format_on_insert_leave=1  "退出插入模式时自动格式化

function! Terminal_MetaMode()
    set ttimeout ttimeoutlen=30
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(key)
        exec "set <M-".a:key.">=\e".a:key
    endfunc
    for i in range(10)
        call s:metacode(nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(nr2char(char2nr('a') + i))
        if i != 14
            call s:metacode(nr2char(char2nr('A') + i))
        endif
    endfor

endfunc
call Terminal_MetaMode()


autocmd FileType typescript,typescriptreact nmap <M-c> :YcmCompleter GoToCallers<CR>
autocmd FileType typescript,typescriptreact nmap <M-e> :YcmCompleter GoToCallees<CR>
autocmd FileType typescript,typescriptreact nmap <Leader>f :YcmCompleter FixIt<CR>
autocmd FileType typescript,typescriptreact nmap <M-g> :YcmCompleter GoToDefinition<CR>
autocmd FileType typescript,typescriptreact nmap <M-r> :YcmCompleter RefactorRename 
au BufNewFile,BufRead *.fs,*.vs set filetype=glsl
map <C-s> :w<CR>
map <C-]> :YcmCompleter GoTo<CR>
map<M-t> :ter ++noclose<CR>

nnoremap j gj;
nnoremap k gk;
nnoremap <up> g<up>;
nnoremap <down> g<down>;
filetype plugin indent on


" from https://github.com/OmniSharp/omnisharp-vim/wiki/Example-config
" Settings: {{{
if !exists('g:syntax_on') | syntax enable | endif
scriptencoding utf-8

set completeopt=menuone,noinsert,noselect,popuphidden
set completepopup=highlight:Pmenu,border:off

set backspace=indent,eol,start
set expandtab
set shiftround
set softtabstop=-1
set title

set hidden
set nofixendofline
set nostartofline
set splitbelow
set splitright

set hlsearch
set incsearch
set laststatus=2
" set nonumber
set noruler
set noshowmode
set signcolumn=yes

set mouse=a
set updatetime=1000
" }}}

" Colors: {{{
augroup ColorschemePreferences
    autocmd!
    " These preferences clear some gruvbox background colours, allowing transparency
    autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
    " Link ALE sign highlights to similar equivalents without background colours
    autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
    autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
    autocmd ColorScheme * highlight link ALEInfoSign    Identifier
augroup END

" Use truecolor in the terminal, when it is supported
if has('termguicolors')
    set termguicolors
endif

set background=dark
colorscheme gruvbox
" }}}

" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" Asyncomplete: {{{
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
" }}}

" Sharpenup: {{{
" All sharpenup mappings will begin with `<Space>os`, e.g. `<Space>osgd` for
" :OmniSharpGotoDefinition
let g:sharpenup_map_prefix = '<Space>os'

let g:sharpenup_statusline_opts = { 'Text': '%s (%p/%P)' }
let g:sharpenup_statusline_opts.Highlight = 0

augroup OmniSharpIntegrations
    autocmd!
    autocmd User OmniSharpProjectUpdated,OmniSharpReady call lightline#update()
augroup END
" }}}

" Lightline: {{{
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'right': [
            \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
            \     ['lineinfo'], ['percent'],
            \     ['fileformat', 'fileencoding', 'filetype', 'sharpenup']
            \   ]
            \ },
            \ 'inactive': {
            \   'right': [['lineinfo'], ['percent'], ['sharpenup']]
            \ },
            \ 'component': {
            \   'sharpenup': sharpenup#statusline#Build()
            \ },
            \ 'component_expand': {
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_infos': 'lightline#ale#infos',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok'
            \  },
            \ 'component_type': {
            \   'linter_checking': 'right',
            \   'linter_infos': 'right',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'right'
            \  }
            \}
" Use unicode chars for ale indicators in the statusline
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "
" }}}

" OmniSharp: {{{
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
    let g:OmniSharp_popup_options = {
                \ 'winhl': 'Normal:NormalFloat'
                \}
else
    let g:OmniSharp_popup_options = {
                \ 'highlight': 'Normal',
                \ 'padding': [0, 0, 0, 0],
                \ 'border': [1]
                \}
endif
let g:OmniSharp_popup_mappings = {
            \ 'sigNext': '<C-n>',
            \ 'sigPrev': '<C-p>',
            \ 'pageDown': ['<C-f>', '<PageDown>'],
            \ 'pageUp': ['<C-b>', '<PageUp>']
            \}

if s:using_snippets
    let g:OmniSharp_want_snippet = 1
endif

let g:OmniSharp_highlight_groups = {
            \ 'ExcludedCode': 'NonText'
            \}

" 当文件类型是 typescript 或 html 时，执行该命令
let g:user_emmet_leader_key=','

" }}}

" 为 JSX 和 TSX 文件启用语法高亮
filetype plugin indent on

" 为 JSX 文件启用 Vim-jsx-pretty
let g:jsx_pretty_enabled = 1

" 为 TSX 文件启用 Vim-tsx-react
let g:tsx_react_enabled = 1

" 为 TypeScript 文件启用 YCM
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_clangd = 1
"let g:coc_global_extensions = [
"  \ 'coc-tsserver'
"  \ ]
"if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"  let g:coc_global_extensions += ['coc-prettier']
"endif
"
"if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"  let g:coc_global_extensions += ['coc-eslint']
"endif
" au BufWrite *.c :Autoformat
au BufWrite *.hxx :Autoformat
au BufWrite *.rs :YcmCompleter Format
au BufWrite *.ts :YcmCompleter Format
au BufWrite *.tsx :YcmCompleter Format
au BufWrite *.css :Autoformat
" au BufWrite *.c if expand('<afile>') !~ 'wasm' | :Autoformat | endif
" au BufWrite *.cpp if expand('<afile>') !~ 'wasm' | :Autoformat | endif
" au BufWrite *.h if expand('<afile>') !~ 'wasm' | :Autoformat | endif
" au BufWrite *.hpp if expand('<afile>') !~ 'wasm' | :Autoformat | endif
" au BufWrite *.cc if expand('<afile>') !~ 'wasm' | :Autoformat | endif
" au BufWrite *.cxx if expand('<afile>') !~ 'wasm' | :Autoformat | endif
" au BufWrite *.hxx if expand('<afile>') !~ 'wasm' | :Autoformat | endif
" au BufWrite *.rs :YcmCompleter Format
" au BufWrite *.ts :YcmCompleter Format
" au BufWrite *.tsx :YcmCompleter Format
" au BufWrite *.css :Autoformat

let g:leetcode_china=1
let g:leetcode_solution_filetype='cpp'    
let g:leetcode_browser='chrome'
" let g:leetcode_debug=1

" 创建一个函数来处理带条件的格式化
function! s:ConditionalCppFormat()
  " 判断文件名是否以 .wasm.cpp 结尾
  if expand('%') !~ 'wasm\.cpp$'
    " 如果不是，则执行 Autoformat
    Autoformat
  " else
    " 如果是，你甚至可以在这里输出一条消息来确认跳过了格式化（可选）
    " echo "Skipping auto-format for WASM C++ file."
  endif
endfunction

" 使用 augroup 来确保命令不会被重复定义
augroup MyCppFormatting
  " 清除这个组里所有已定义的 autocmd
  autocmd!
  " 定义新的 autocmd，在保存 .cpp 文件时调用上面的函数
  autocmd BufWrite *.cpp call <SID>ConditionalCppFormat()
  au BufWrite *.h :Autoformat call <SID>ConditionalCppFormat()
  au BufWrite *.hpp :Autoformat call <SID>ConditionalCppFormat()
  au BufWrite *.cc :Autoformat call <SID>ConditionalCppFormat()
  au BufWrite *.cxx :Autoformat call <SID>ConditionalCppFormat()

augroup END

vmap <C-c> "ay:call CopyA()<CR>

function! IsWSL() 
  if has('unix')
    let lines = readfile('/proc/version')
    if lines[0] =~ 'Microsoft'
      return 1
    endif 
  endif 
  return 0
endfunction

function! CopyA()
  if IsWSL()
python3 <<EOF
import vim 
import subprocess
content = vim.eval('@a')
process = subprocess.Popen('clip.exe', stdin=subprocess.PIPE, stdout=subprocess.PIPE)
process.communicate(content.encode())
EOF
  else 
python3 <<EOF
import vim 
import subprocess
content = vim.eval('@a')
process = subprocess.Popen(['xclip', '-selection', 'clipboard'] , stdin=subprocess.PIPE, stdout=subprocess.PIPE)
process.stdin.write(content.encode())
process.stdin.close()
EOF
  endif 
endfunction
" ==============================================================================
" Vim 脚本: ToggleHeaderSource
" 功能: 在 .h/.hpp 和 .cpp/.c/.cc 文件之间快速切换
" 绑定: Alt-h
" ==============================================================================

function! ToggleHeaderSource()
    let l:current_file = expand('%:p')   " 获取当前文件的完整路径
    let l:base_name = expand('%:r')      " 获取不带扩展名的文件名 (例如: /path/to/my_file)
    let l:ext = expand('%:e')            " 获取当前文件的扩展名 (例如: h, cpp)

    let l:target_file = ''               " 目标文件路径

    " 定义可能的头文件和源文件扩展名
    let l:header_exts = ['h', 'hpp']
    let l:source_exts = ['cpp', 'c', 'cc']

    " 检查当前文件是头文件还是源文件
    if index(l:header_exts, l:ext) != -1
        " 当前是头文件 (.h 或 .hpp)
        " 尝试查找对应的源文件 (.cpp, .c, .cc)
        for s_ext in l:source_exts
            let l:potential_target = l:base_name . '.' . s_ext
            if filereadable(l:potential_target)
                let l:target_file = l:potential_target
                break
            endif
        endfor
    elseif index(l:source_exts, l:ext) != -1
        " 当前是源文件 (.cpp, .c, .cc)
        " 尝试查找对应的头文件 (.h, .hpp)
        for h_ext in l:header_exts
            let l:potential_target = l:base_name . '.' . h_ext
            if filereadable(l:potential_target)
                let l:target_file = l:potential_target
                break
            endif
        endfor
    else
        " 当前文件既不是常见的头文件也不是源文件
        echohl WarningMsg | echo "当前文件不是C/C++头文件或源文件。" | echohl None
        return
    endif

    " 如果找到了目标文件，则打开它
    if !empty(l:target_file)
        " 使用 'edit' 命令在当前窗口打开文件
        execute 'edit ' . l:target_file
    else
        " 没有找到对应的文件
        echohl WarningMsg | echo "未找到对应的C/C++文件: " . l:base_name | echohl None
    endif
endfunction

" 绑定 Alt-h 到 ToggleHeaderSource 函数
" nnoremap 表示在普通模式下非递归地映射
" <M-h> 表示 Alt-h (在某些终端中可能需要配置或使用 <A-h>)
" <CR> 表示回车，执行命令
nnoremap <M-h> :call ToggleHeaderSource()<CR>

" 提示: 如果 Alt-h 在您的终端中不起作用，可能是终端模拟器捕获了 Alt 键。
" 您可以尝试以下替代方案:
" 1. 检查您的终端设置，看是否可以将 Alt 键配置为发送 Meta 键序列。
" 2. 尝试使用其他按键组合，例如 F2 或 Ctrl-P (如果未被占用)。
"    nnoremap <F2> :call ToggleHeaderSource()<CR>
"    nnoremap <C-p> :call ToggleHeaderSource()<CR>

function! SafeJsonFormatWithLimit()
    " --- 配置参数 ---
    let l:min_size = 10         " 最小 10 字节 (防止格式化空文件)
    let l:max_size = 1048576    " 最大 1MB (1024 * 1024)

    " 获取当前文件大小 (单位: Byte)
    let l:current_size = getfsize(expand('%'))

    " 判断逻辑：如果在指定范围内且文件已被修改
    if l:current_size >= l:min_size && l:current_size <= l:max_size
        if &modified
            " 预检查 JSON 语法
            let l:check_cmd = "jq . " . shellescape(expand('%')) . " > /dev/null 2>&1"
            call system(l:check_cmd)

            if v:shell_error == 0
                " 语法正确，执行格式化
                silent %!jq . --indent 4
                echo "JSON 自动格式化完成 (大小: " . l:current_size . " 字节)"
            else
                echohl WarningMsg
                echo "JSON 语法错误，已取消自动格式化"
                echohl None
            endif
        endif
    else
        " 如果文件太大，给出提示以免引起保存卡顿
        if l:current_size > l:max_size
            echo "文件过大 (" . (l:current_size / 1024) . " KB)，已跳过自动格式化"
        endif
    endif
endfunction

" 设置自动命令
augroup JsonAutoFormat
    autocmd!
    " 针对 json 文件在保存前执行
    autocmd BufWritePre *.json call SafeJsonFormatWithLimit()
augroup END


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列
"set cursorline
"set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

"开启语法高亮功能
syntax enable
syntax on

" 防止粘贴时影响缩进, 打开后会使部分插件不工作
"set paste

"设置搜索时忽略大小写
set ignorecase

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

if has("gui_running")
    "set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T       " 隐藏工具栏
    set guioptions-=L       " 隐藏左侧滚动条
    set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=b       " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif

"set guifont=YaHei\ Consolas\ Hybrid\ 11.5
set backspace=indent,eol,start

if has("gui_running")
    set guifont=Monaco:h12
    set lines=40 columns=120
endif

"set lines=42 columns=148
" 终端下真彩色
set termguicolors 

" 文件类型检测，不设置某些插件无法使用
filetype plugin indent on

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" 生成tags
" Plug 'jsfaint/gen_tags.vim'

" tagbar
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
map <F7> :TagbarToggle<CR>
"设置ctags路径
let g:tagbar_ctags_bin = "/Users/zke1e/Optional/ctags-5.8/ctags"
let g:tagbar_width = 30       "设置宽度，默认为40  
"autocmd VimEnter * nested :call tagbar#autoopen(1)    "打开vim时自动打开  
let g:tagbar_right = 1        "在右侧 

" 代码对齐虚线
Plug 'Yggdroot/indentLine'

" 代码补全
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/Users/zke1e/.virtualenvs/neovim3/bin/python'
" 设置用tab键进行补全
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


" 代码检查
Plug 'w0rp/ale'

" 始终开启标志列
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0
" 只对在ale_linters中声明的文件使用ale
 let g:ale_linters_explicit = 1
" 设置一段延迟时间，以节省电量
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
" 设置提示文本的格式
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" 设置在normal模式或者离开插入模式时运行linter
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" 启用airline对于ale的扩展
let g:airline#extensions#ale#enabled = 1

let g:ale_virtualenv_dir_names = ['/Users/zke1e/.virtualenvs/neovim3']

" 使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'cpp': ['clang'],
\   'c': ['clang'],
\   'python': ['flake8'],
\}

"let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''


" 主题插件
Plug 'tomasr/molokai'
let g:molokai_original=0

Plug 'altercation/vim-colors-solarized'

" 配色规划
set background=dark
set t_Co=256
" colorscheme molokai 

" 自动补全符号
Plug 'jiangmiao/auto-pairs'

" 使用符号包围现有字符
Plug 'tpope/vim-surround'

" 快速跳转
Plug 'Lokaltog/vim-easymotion'
let mapleader = ","

" 状态栏
Plug 'vim-airline/vim-airline'

" 文件目录
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" 映射快捷键
map <F8> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w
" 设置当仅存在NERDTree窗口时关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Initialize plugin system
call plug#end()

" 配色
colorscheme molokai 

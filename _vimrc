set tags+=~/.vim/tags
syntax enable
syntax on
set cursorline
hi CursorLine  cterm=NONE   ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
filetype plugin indent on
set t_Co=256
set background=dark  "dark light "can switch it to find which is look pretty
set hlsearch                     "highlight the search
set incsearch                    "move to fit position after one char input
set nobackup                     "won't produce the backup file when save file
set nowritebackup                "won't produce the backup file when save file
set noswapfile                   "won't use swapfile
set hidden                       "can open other file when a file is not saved
set ruler                        "show ruler at the right bottom
set wrap                       "disable auto newline
set laststatus=2                 "status bar will show anytime
set updatetime=200               "tagbar response 800ms
set showmatch matchtime=0        "show the other bracket
set wmnu wildmode=longest:full   "when in command mode can use auto complete same as bash
set expandtab tabstop=4          "expand the tab to 4 space
set si ai ci cinkeys-=0# cinoptions=g0,:0   "some indent rules
set shiftwidth=4                 "make the indent 4 length
set softtabstop=4                "backspace can del 4 space
set lcs=eol:$,tab:\|\            "display tab to green line
set backspace=indent,eol,start   "better backspace
set fileencodings=utf-8,cp936    "auto test the file is uft-8 or cp936
set encoding=utf-8             " 设置utf-8
set fileformats=unix,dos,mac     "line feed different in different mode
set completeopt=menuone,longest
set relativenumber


set clipboard=unnamed "使用windows的剪切板
colorscheme gruvbox

set foldmethod=syntax "用语法高亮来定义折叠
set foldlevel=100   "启动vim时不要自动折叠代码
set foldcolumn=5    "设置折叠栏的宽度

"插件管理
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" 地下栏美观优化
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" markdown插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" javascript，html，css，json格式化工具
Plugin 'maksimr/vim-jsbeautify'
" 快速打开文件
Plugin 'ctrlpvim/ctrlp.vim'
" 自动闭合html、xml标签
Plugin 'alvan/vim-closetag'
" 最大最小化当前窗口
Plugin 'szw/vim-maximizer'
" vimgrep的简易使用插件
Plugin 'dkprice/vim-easygrep'
" 注释
Plugin 'scrooloose/nerdcommenter'
" 鼠标快速移动
Plugin 'easymotion/vim-easymotion'
" 浏览当前打开的文件
Plugin 'jlanzarotta/bufexplorer'
call vundle#end()

" 文档树
Bundle 'scrooloose/nerdtree'
" emmet插件
Bundle 'mattn/emmet-vim'
" 自动配对{} ()
Bundle 'Auto-Pairs'
" javascript语法库高亮
Bundle 'othree/javascript-libraries-syntax.vim'

" nerdTree快捷键映射
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

" 设置emmet快捷 ctrl+tab
let g:user_emmet_expandabbr_key = '<c-tab>'
let g:user_emmet_settings = {'indentation': '    '}
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" 格式化快捷键 ctrl+f
map <c-f> :call JsBeautify()<cr>

" 设置快速打开文件快捷键 ctrl+p, 设置忽略的文件夹
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*\\node_modules\\*,*.git*,*.svn*,*.zip*,*.exe* " 使用vim的忽略文件

" F3 快捷键，最大最小化窗口
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

" 配置注释空出一个字符，美观
let g:NERDSpaceDelims = 1

" 识别语法库
let g:used_javascript_libs = 'jquery,requirejs'

" 快捷键f8 浏览当前打开的文件
nnoremap <silent><F8> :BufExplorer<CR>

"-------快捷键映射--------"

" 切换窗口 在normal模式下，tab 键切换从左到右切换窗口
nmap <tab> <c-w><c-w>

" 将 <leader> 映射到<space>
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" 保存全部，不然打开的项目文件一多有时间就忘记保存了
nnoremap <leader>w :wa <CR>

" 执行npm run develop，效果是执行之后，将log打到vim的缓存区
function BuildProject ()
    " 先保存全部，在进行项目的构建
    exe 'wa'
    exe 'new | setlocal buftype=nofile bufhidden=hide | read !npm run develop '
endfunction
nmap <silent><F5> :call BuildProject()<CR>

" <leader>h 去除搜索后的高亮
nmap <leader>h :nohlsearch<CR>

" 快速打开配置文件
nmap <leader>ev :e $VIM/_vimrc<CR>

"-------gvim 的界面设置--------"

set guioptions-=T              " 去除工具栏
set guioptions-=m              " 去除顶部的菜单栏
set guioptions-=l              " 去除左边的滚动条
set guioptions-=L              " 去除左边的滚动条
set guioptions-=r              " 去除右边的滚动条
set guioptions-=R              " 去除右边的滚动条
set guifont=Consolas:h14       " 设置字体


" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"added by zs
""{{{
map <F8> :NERDTreeToggle<CR>.
map <F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>
""}}}
set runtimepath +=/usr/share/vim/vim72/phpman
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"
" autoload _vimrc
autocmd! bufwritepost vimrc source %
map <special> <F6> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/php" %<cr>
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap ' ''<Esc>i
:inoremap " ""<Esc>i
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

set nu ""显示行号
set nolist "" set list 显示制表位和行尾标志$
set wrap ""超长行显示时自动换行
"set paste  ""粘贴时保留格式
"" set nohls 取消高亮
syntax enable "打开语法高亮
set autoindent "Vim在打开新行时保留上一行的缩进方式
set cindent  "使用C语言的缩进
set showcmd  "在Vim窗口的右下角显示一个完整的命令已经完成的部分
set background=dark


""search options start
set ignorecase ""搜索时忽略大小写
set hlsearch  ""搜索时高亮结果
set incsearch "键入目标字符串的过程中就开始搜索
" 高亮显示匹配的括号
set showmatch
""search options end

set fdm=syntax  "设置折叠方式，其他好用的还有manual indent syntax marker
filetype on
filetype plugin on
filetype indent on 
set shortmess=atI "关闭启动空Vim时的屏幕中间的文字
set laststatus =2 "显示状态栏

"光标所在行
"highlight cursorline

set cursorline

set nocompatible
set confirm
set history=100
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%))

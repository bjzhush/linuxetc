"added by zs
""{{{
""map <F8> :NERDTreeToggle<CR>.
""map <F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>
""}}}
set runtimepath +=/usr/share/vim/vim72/phpman
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"
" autoload _vimrc
autocmd! bufwritepost vimrc source %
map <special> <F6> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/php" %<cr>
map <special> <F5> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/python" %<cr>
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

set tabstop=4
set shiftwidth=4

set smartcase		" Do smart case matching
set scrolloff=5
set showcmd
set statusline=%F%m%r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\ in\ all\ ]
""新增Tab栏几相关操作配置 
"" F8 上一个标签，F9下一个标签，F12关闭当前标签
nnoremap <silent> <F8> :tabp<CR>
nnoremap <silent> <F9> :tabn<CR>
nnoremap <silent> <F12> :tabc<CR>
"""" Ctrl+W 执行 ：w 操作，保存当前文件
""nmap <C-W> :w<cr>
"" here is not comtiable
""nmap <C-Q> :wq<cr>

"
" vimconfig - project of powerful ViM 6.3 configuration files
" 
" vimrc - main configuration file
" ____________________________________________________________
"
" Developed by Lubomir Host 'rajo' <rajo AT platon.sk>
" Copyright (c) 2000-2005 Platon SDG, http://platon.sk/
" All rights reserved.
"
" See README file for more information about this software.
" See COPYING file for license information.
"
" Download the latest version from
" http://platon.sk/projects/vimconfig/
"

" Please don't hesitate to correct my english :)
" Send corrections to
"
"        Lubomir Host 'rajo' <rajo AT platon.sk>

" Version: $Platon: vimconfig/vimrc,v 1.114 2007-09-28 22:36:15 rajo Exp $

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
if !filereadable(expand("$VIMRUNTIME/doc/help.txt"))
	if filereadable(expand("$VIMRUNTIME/doc/help.txt.gz"))
		set helpfile=$VIMRUNTIME/doc/help.txt.gz
	endif
endif

" Settings {{{
" Basic settings {{{
" To be secure & Vi nocompatible
:set secure nocompatible
:if version < 600
:	echo "Please update your vim to 6.x version (version 6.3 is available, version 7.0 vill be soon!)"
:	finish
:endif


function! Source(File)
	silent! execute "source " . a:File
endfunction


" used for searching documentation (~/.vim/doc/FEATURES.txt) etc.
set runtimepath+=~/.vim
" }}}


" History and viminfo settings {{{
if has("cmdline_hist") 
	set history=10000
endif
if has("viminfo")
	if filewritable(expand("$HOME/.vim/viminfo")) == 1 || 
				\ filewritable(expand("$HOME/.vim/")) == 2
		set viminfo=!,%,'5000,\"10000,:10000,/10000,n~/.vim/viminfo
	else
		set viminfo=
	endif
endif
" Don't save backups of files.
set nobackup
set backupcopy=yes
" }}}

" Status line settings {{{
":set ruler
" Display a status-bar.
set laststatus=2
if has("statusline")
	set statusline=%5*%{GetID()}%0*#%{winnr()}\ %<%f\ %3*%m%1*%r%0*\ %2*%y%4*%w%0*%=[%b\ 0x%B]\ \ %8l,%10([%c%V/%{strlen(getline(line('.')))}]%)\ %P
endif
" }}}

" Settings for Calendar plugin {{{
if !exists("g:calendar_diary")
	let g:calendar_diary = "~/.vim/diary"
endif
" }}} 
" Settings for Explorer script {{{
if !exists("g:explDetailedHelp")
	let g:explDetailedHelp=1
endif
if !exists("g:explDetailedList")
	let g:explDetailedList=1
endif
if !exists("g:explDateFormat")
	let g:explDateFormat="%d %b %Y %H:%M"
endif
" }}}

" vim-jsbeautify {{{
" https://github.com/maksimr/vim-jsbeautify
" set path to js-beautify file
""let s:rootDir = expand("$HOME/.vim")
""let g:jsbeautify_file = fnameescape(s:rootDir."/bundle/js-beautify/beautify.js")
""let g:htmlbeautify_file = fnameescape(s:rootDir."/bundle/js-beautify/beautify-html.js")
""let g:cssbeautify_file = fnameescape(s:rootDir."/bundle/js-beautify/beautify-css.js")
""
""let g:jsbeautify = {'indent_size': 4, 'indent_char': '\t'}
""let g:htmlbeautify = {'indent_size': 4, 'indent_char': ' ', 'max_char': 120, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
""let g:cssbeautify = {'indent_size': 4, 'indent_char': ' '}



" Priority between files for file name completion (suffixes) {{{
" Do not give .h low priority in command-line filename completion.
set suffixes-=.h
set suffixes+=.aux
set suffixes+=.bbl
set suffixes+=.blg
set suffixes+=.log
set suffixes+=.eps
set suffixes+=.ps
set suffixes+=.pdf

set wildignore+=*.dvi
set wildignore+=*.pdf
set wildignore+=*.o
set wildignore+=*.ko
set wildignore+=*.swp
set wildignore+=*.aux
set wildignore+=*.bbl
set wildignore+=*.blg
" }}}

" Tip #935 hightlight space errors {{{

" To highlight spaces at the end of a line and spaces in front of tabs you can simply add the following command to your vimrc:
" let <language>_space_errors=1
" supported languages are:
" ada, c, chill, csc, icon, java, lpc, mel, nqc, nroff, ora, plm, plsql and python. So if you want to highlight space errors in lpc-giles you have to write:
" let lpc_space_errors=1
"
" If you don't want to see the errors at the end of the line set:
" let <language>_no_trail_space_error=1
" and if you only use spaces to indent and don't want to see the space errors in front of tabs set:
" let <language>_no_tab_space_error=1
let java_space_errors=1
let c_space_errors=1
let python_space_errors=1
" }}}
" Basic2 {{{

" The cursor is kept in the same column (if possible).  This applies to the
" commands: CTRL-D, CTRL-U, CTRL-B, CTRL-F, "G", "H", "M", "L", , and to the
" commands "d", "<<" and ">>" with a linewise operator, with "%" with a count
" and to buffer changing commands (CTRL-^, :bnext, :bNext, etc.).  Also for an
" Ex command that only has a line number, e.g., ":25" or ":+".
set nostartofline

" Automatically setting options in various files
" WARNINNG: disable modeline if you are running vim version < 6.1.265 !!
"           These are security problems. See http://www.guninski.com/vim1.html
"                                                (reported by Georgi Guninski)
" TODO: there is no way how to test vim patchlevel version, therefore we are
"       not able determine vim version < 6.1.265
set modeline

" Available TAGS files
set tags=./TAGS,./tags,tags

" Don't add EOF at end of file
set noendofline

" Do case sensitive matching
set noignorecase

set showfulltag 

set cmdheight=2
set backspace=2
set incsearch
set report=0
set showcmd showmatch showmode

" Set title of the window to Platon's copyright
" set titleold=
" set titlestring=ViMconfig\ (c)\ 2000-2005\ Platon\ SDG
" set title

" Indent of 1 tab with size of 4 spaces
set tabstop=4 
set shiftwidth=4 

" Need more undolevels ??
" (default 100, 1000 for Unix, VMS, Win32 and OS/2)
set undolevels=10000

" Use an indent of 4 spaces, with no tabs. This setting is recommended by PEAR
" (PHP Extension and Application Repository) Conding Standarts. If you want
" this setting uncomment the expandtab setting below.
":set expandtab 

" Settings for mouse (gvim under Xwindows)
set nomousefocus
set mousehide
set mousemodel=popup

" The screen will not be redrawn while executing macros, registers
" and other commands that have not been typed. To force an updates use |:redraw|.
set lazyredraw

" time out on mapping after one second, time out on key codes after
" a tenth of a second
set timeout timeoutlen=1000 ttimeoutlen=100

" command completition
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full

"set clipboard=unnamed

" Allow specified keys that move the cursor left/right to wrap to the
" previous/next line when the cursor is on the first/last character in the
" line. Allowed keys are 'h' and 'l', arrow keys are not allowed to wrap.
set whichwrap=h,l

set hlsearch
set nonu

set ambiwidth=double

" Customize display {{{
" lastline	When included, as much as possible of the last line
"			in a window will be displayed.  When not included, a
"			last line that doesn't fit is replaced with "@" lines.
"uhex		Show unprintable characters hexadecimal as <xx>
"			instead of using ^C and ~C.
set display+=lastline
set display+=uhex
" }}}

" Vim beeping go to the hell... {{{
" With very little patch Vim(gvim) doesn't beep! To dissable beeping patch
" source and set ':set noerrorbells' (default).
" Here is patch for version 6.0.193:
" Note: file src/misc1.c was modified with theses patches:
"       6.0.024 6.0.089 6.0.113 6.0.178 6.0.180
"       but patch (probably) also work!
" Patch:
"*** vim60.193/src/misc1.c.orig	Sat Feb  9 01:49:54 2002
"--- vim60.193/src/misc1.c	Sat Feb  9 02:17:16 2002
"***************
"*** 2721,2727 ****
"      void
"  vim_beep()
"  {
"!     if (emsg_silent == 0)
"      {
"  	if (p_vb)
"  	{
"--- 2721,2727 ----
"      void
"  vim_beep()
"  {
"!     if (emsg_silent == 0 && p_eb)
"      {
"  	if (p_vb)
"  	{
set noerrorbells
set visualbell
set t_vb=
" }}}

" Set this, if you will open all windows for files specified
" on the commandline at vim startup.
if !exists("g:open_all_win")
	let g:open_all_win=1
endif

" Settings for folding long lines
if !exists("g:fold_long_lines")
	let g:fold_long_lines=300
endif
"}}}

" }}}


" Settings for IMAP input method (IMAP plugin) {{{

" detect iso-8859-2 encoding before latin1
set fileencodings=ucs-bom,utf-8,iso-8859-2,windows-1250,latin1

" set variable "b:input_method" to change input method
" let b:input_method = "latin2"
let b:input_method = &encoding

" you may disable actions of IMAP plugin with variable b:disable_imap
" 0 - enabled
" 1 - disabled
let b:disable_imap = 0

call Source("~/.vim/plugin/imaps.vim")

" }}}

" New commands {{{
command! -nargs=0 -range Indent          <line1>,<line2>call Indent()
command! -nargs=0 -range FoldLongLines   <line1>,<line2>call FoldLongLines()
command! -nargs=0 -range UnquoteMailBody <line1>,<line2>call UnquoteMailBody()
command! -nargs=0 CallProg				call CallProg()
command! -nargs=0 OpenAllWin			call OpenAllWin()
command! -nargs=* ReadFileAboveCursor	call ReadFileAboveCursor(<f-args>)
command! -nargs=* R						call ReadFileAboveCursor(<f-args>)
command! -nargs=0 DiacriticsOn			call ChooseInputMethod(0)
command! -nargs=0 DiacriticsOff			let b:disable_imap=1
" cd to whatever directory the current buffer is using
command! CD cd %:p:h
" }}}

" Functions {{{
" Function ChangeFoldMethod() {{{
" Function for changing folding method.
"
if version >= 600
	function! ChangeFoldMethod() abort
		let choice = confirm("Which folde method?", "&manual\n&indent\n&expr\nma&rker\n&syntax", 2)
		if choice == 1
			set foldmethod=manual
		elseif choice == 2
			set foldmethod=indent
		elseif choice == 3
			set foldmethod=expr
		elseif choice == 4
			set foldmethod=marker
		elseif choice == 5
			set foldmethod=syntax
		else
		endif
	endfunction
endif
" ChangeFoldMethod() }}}

" Function FoldLongLines() {{{
"
if version >= 600
	function! FoldLongLines() range abort
		let savelnum = line(".")
		let lnum = a:firstline
		let lend = a:lastline
		if lnum == lend
			" No visual area choosen --> whole file
			let lnum = line(".")
			let lend = line("$")
			" Go to the begin of the file
			exec "1go"
		endif
		while lnum <= lend
			" Skip closed folds
			if foldclosed(lnum) != -1
				let lnum = foldclosedend(lnum) + 1
				continue
			endif
			let dlzka = strlen(getline("."))
			if dlzka >= g:fold_long_lines
				" Create fold for one line
				exec "normal zfl"
			endif
			let lnum = line(".")
			" Move one line down
			exec "normal j"
			if lnum == lend
				break
			endif
		endwhile
		" ...and go back
		exec "normal " . savelnum . "G"
		redraw!
	endfunction
endif
" FoldLongLines() }}}

" Function AutoLastMod() {{{
" Provides atomatic change of date in files, if it is set via
" modeline variable autolastmod to appropriate value.
"
function! AutoLastMod()
	if exists("g:autolastmod")
		if g:autolastmod < 1
			return 0;
		elseif g:autolastmod == 1
			call LastMod(g:autolastmodtext)
		endif
	endif
endfunction
" AutoLastMod() }}}

" Function LastMod() {{{
" Automatic change date in *.html files.
"
function! LastMod(text, ...)
	mark d
	let line = "\\1" . strftime("%Y %b %d %X") " text of changed line
	let find = "g/" . a:text           " regexpr to find line
	let matx = a:text . ".*"            " ...if line was found
	exec find
	let curr_line = getline(".")
	if match(curr_line, matx) == 0
		" call setline(line("."), line)
		call setline(line("."), substitute(getline("."), matx, line, ""))
		exec "'d"
	endif
endfunction
" LastMod() }}}

" Function OpenAllWin() {{{
" Opens windows for all files in the command line.
" Variable "opened" is used for testing, if window for file was already opened
" or not. This is prevention for repeat window opening after ViM config file
" reload.
"
function! OpenAllWin()
	" save Vim option to variable
	let s:save_split = &splitbelow
	set splitbelow

	let s:i = 1
	if g:open_all_win == 1
		while s:i < argc()
			if bufwinnr(argv(s:i)) == -1	" buffer doesn't exists or doesn't have window
				exec ":split " . escape(argv(s:i), ' \')
				"echo "Current window is " . bufwinnr(s:i) 
			endif
			let s:i = s:i + 1
		endwhile
	endif

	" force first window to be maximalized. Behaviour of vim has changed after
	" 6.2(?) release, therefore next command is not needed for vim < 6.2(?)
	exec "normal 2\<C-w>\<C-w>1\<C-w>\<C-w>"

	" restore Vim option from variable
	if s:save_split
		set splitbelow
	else
		set nosplitbelow
	endif
endfunction
" OpenAllWin() }}}

" Function CallProg() {{{
function! CallProg() abort
	let choice = confirm("Call:", "&make\nm&ake in cwd\n" .
				\ "&compile\nc&ompile in cwd\n" .
				\ "&run\nr&un in cwd")
	if choice == 1
		exec ":wall"
		exec "! cd %:p:h; pwd; make " . g:makeflags
	elseif choice == 2
		exec ":wall"
		exec "! cd " .
					\ getcwd() . "; pwd; make " . g:makeflags
	elseif choice == 3
		:call Compile(1)
	elseif choice == 4
		:call Compile(0)
	elseif choice == 5
		exec "! cd %:p:h; pwd; ./%:t:r"
	elseif choice == 6
		exec "! cd " . getcwd() . "; pwd; ./%<"
	endif
endfunction
" CallProg() }}}

" Function Compile() {{{
function! Compile(do_chdir) abort
	let cmd = ""
	let filename = ""
	let filename_ext = ""

	if a:do_chdir == 1
		let cmd = "! cd %:p:h; pwd; "
		let filename = "%:t:r"
		let filename_ext = "%:t"
	else
		let cmd = "! cd " . getcwd() . "; pwd; "
		let filename = "%<"
		let filename_ext = "%"
	endif

	let choice = confirm("Call:", 
				\ "&compile\n" .
				\ "compile and &debug\n" .
				\ "compile and &run\n" .
				\ "compile using first &line")

	if choice != 0
		exec ":wall"
	endif

	if choice == 1
		exec cmd . "gcc " . g:cflags . 
					\ " -o " . filename . " " . filename_ext
	elseif choice == 2
		exec cmd . "gcc " . g:cflags . " " . g:c_debug_flags . 
					\ " -o " . filename . " " . filename_ext " && gdb " . filename
	elseif choice == 3
		exec cmd . "gcc " . g:cflags . 
					\ " -o " . filename . " " . filename_ext " && ./" . filename
	elseif choice == 4
		exec cmd . "gcc " . g:cflags . 
					\ " -o " . filename . " " . filename_ext . 
					\ substitute(substitute(getline(2), "VIMGCC", "", "g"), "GCC", "", "g" )
	endif
endfunction
" Compile() }}}

" Function Indent() {{{
" Indents source code.
function! Indent() range abort
	let savelnum = line(".")
	let lnum = a:firstline
	let lend = a:lastline
	if lnum == lend
		" No visual area choosen --> whole file
		let lnum = line(".")
		let lend = line("$")
		" Go to the begin of the file
		exec "1go"
	endif
	exec "normal " . lnum . "Gv" . lend . "G="
	exec "normal " . savelnum . "G"
endfunction
" Indent() }}}

" Function UnquoteMailBody() {{{
"
function! UnquoteMailBody() range abort
	" Every backslash character must be escaped in function -- Nepto
	"exec "normal :%s/^\\([ ]*>[ ]*\\)*\\(\\|[^>].*\\)$/\\2/g<CR>"
	let savelnum = line(".")
	let lnum = a:firstline
	let lend = a:lastline
	if lnum == lend
		" No visual area choosen --> whole file
		let lnum = line(".")
		let lend = line("$")
		" Go to the begin of the file
		exec "1go"
	endif
	exec ":" . lnum . "," . lend . "s/^[ >]\\+//"
	exec "normal " . savelnum . "G"
endfunction
" UnquoteMailBody() }}}

" Function SafeLineDelete() {{{
"
function! SafeLineDelete()
	exec "normal \"_dd"
endfunction
" SafeLineDelete() }}}

" Function GetID() {{{
" - used in statusline.
" If you are root, function return "# " string --> it is showed at begin of
"                                                  statusline
" If you aren't root, function return empty string --> nothing is visible
" Check for your name ID
let g:get_id = $USER
" If you are root, set to '#', else set to ''
if g:get_id == "root"
	let g:get_id = "# "
else
	let g:get_id = ""
endif
function! GetID()
	return g:get_id
endfunction
" GetID() }}}

" Function ReadFileAboveCursor() {{{
"
function! ReadFileAboveCursor(file, ...)
	let str = ":" . (v:lnum - 1) . "read " . a:file
	let idx = 1
	while idx <= a:0
		exec "let str = str . \" \" . a:" . idx
		let idx = idx + 1
	endwhile
	exec str
endfunction
" ReadFileAboveCursor() }}}

" Function RemoveAutogroup() {{{
"
silent! function! RemoveAutogroup(group)
silent exec "augroup! ". a:group
endfunction
" RemoveAutogroup() }}}

" Function SmartBS() {{{
"
" This function comes from Benji Fisher <benji AT e-mathDOTAMSDOTorg>
" http://vim.sourceforge.net/scripts/download.php?src_id=409
" (modified/patched by: Lubomir Host 'rajo' <rajo AT platon.sk>
"                       Srinath Avadhanula  <srinath AT fastmailDOTfm> )
silent function! SmartBS()
	let init = strpart(getline("."), 0, col(".")-1)
	if exists("g:smartBS_" . &filetype)
		silent exec "let matchtxt = matchstr(init, g:smartBS_" . &filetype . ")"
		echo "SmartBS(" . matchtxt . ")"
		if matchtxt != ''
			let bstxt = substitute(matchtxt, '.', "\<bs>", 'g')
			return bstxt
		else
			return "\<bs>"
		endif
	else
		return "\<bs>"
	endif
endfunction

" You can turn on smart backspacing in ftplugin by setting
" g:smartBS_<filetype> variable and turning on mapping
" inoremap <buffer> <BS> <C-R>=SmartBS()<CR>
"
" Example: TeX plugin
"	" set regular expresion for Smart backspacing
"	let g:smartBS_tex = '\(' .
"			\ "\\\\[\"^'=v]{\\S}"      . '\|' .
"			\ "\\\\[\"^'=]\\S"         . '\|' .
" 			\ '\\v \S'                 . '\|' .
"			\ "\\\\[\"^'=v]{\\\\[iI]}" . '\|' .
"			\ '\\v \\[iI]'             . '\|' .
"			\ '\\q \S'                 . '\|' .
" 			\ '\\-'                    .
"			\ '\)' . "$"
"
"	" map <BS> to function SmartBS()
"	inoremap <buffer> <BS> <C-R>=SmartBS()<CR>

" }}} 

" Function ChooseInputMethod() {{{
function! ChooseInputMethod(method)
	let b:disable_imap=0
	let g:available_methods = "&none\n&Tex-universal\n&tex-iso8859-2\n&iso8859-2\n&windows-1250\nunicode-&Html\n&UTF-8"

	if a:method == 0
		let choice = confirm("Choose input mapping:", g:available_methods, 1)
	else
		let choice = a:method
	endif

	if choice == 1
		let b:input_method = "NONE"
	elseif choice == 2
		let b:input_method = "tex-universal"
	elseif choice == 3
		let b:input_method = "tex-iso8859-2"
	elseif choice == 4
		let b:input_method = "iso8859-2"
	elseif choice == 5
		let b:input_method = "windows-1250"
	elseif choice == 6
		let b:input_method = "unicode-html"
	elseif choice == 7
		let b:input_method = "UTF-8"
	endif
	
	if choice == 1
		let b:disable_imap = 1
	elseif choice != 0
		call UseDiacritics()
	endif

endfunction
"}}}

" Function UseDiacritics() {{{
function! UseDiacritics()
	let b:disable_imap = 0
	call Source("~/.vim/modules/diacritics.vim")
endfunction
" }}}

" }}}

" Autocomands {{{
if has("autocmd")

	" Autocomands for PlatonCopyright {{{
	augroup PlatonCopyright
	autocmd!
	autocmd BufLeave * set titlestring=
	autocmd BufLeave * silent! call RemoveAutogroup("PlatonCopyright")
	autocmd WinEnter * set titlestring=
	autocmd WinEnter * silent! call RemoveAutogroup("PlatonCopyright")
	autocmd BufWrite * set titlestring=
	autocmd BufWrite * silent! call RemoveAutogroup("PlatonCopyright")
	autocmd CmdwinEnter * set titlestring=
	autocmd CmdwinEnter * silent! call RemoveAutogroup("PlatonCopyright")
	augroup END
	" }}}

" UGLY hack - preload templatefile.vim. This is needed for loading templates
" for all buffers (when opening all windows for buffers)
call Source("~/.vim/plugin/templatefile.vim")
""augroup TemplateSystem
	""autocmd!
	""au BufNewFile * call LoadTemplateFile()
""augroup END

	" Autocomands for GUIEnter {{{
	augroup GUIEnter
	autocmd!
	if has("gui_win32")
		autocmd GUIEnter * simalt ~x
	endif
	augroup END
	" }}}

	" Autocomands for ~/.vimrc {{{
	augroup VimConfig
	autocmd!
	" Reread configuration of ViM if file ~/.vimrc is saved
	autocmd BufWritePost ~/.vimrc	so ~/.vimrc | exec "normal zv"
	autocmd BufWritePost vimrc   	so ~/.vimrc | exec "normal zv"
	augroup END
	" }}}

	" Autocommands for *.c, *.h, *.cc *.cpp {{{
	augroup C
	autocmd!
	"formatovanie C-zdrojakov
	autocmd BufEnter     *.c,*.h,*.cc,*.cpp	map  <buffer> <c-g> mfggvG$='f
	autocmd BufEnter     *.c,*.h,*.cc,*.cpp	imap <buffer> <c-g> <Esc>mfggvG$='fi
	autocmd BufEnter     *.c,*.h,*.cc,*.cpp	map <buffer> yii yyp3wdwi
	autocmd BufEnter     *.c,*.h,*.cc,*.cpp	map <buffer> <C-K> :call CallProg()<CR>
	autocmd BufRead,BufNewFile  *.c,*.h,*.cc,*.cpp	setlocal cindent
	autocmd BufRead,BufNewFile  *.c,*.h,*.cc,*.cpp	setlocal cinoptions=>4,e0,n0,f0,{0,}0,^0,:4,=4,p4,t4,c3,+4,(2s,u1s,)20,*30,g4,h4
	autocmd BufRead,BufNewFile  *.c,*.h,*.cc,*.cpp	setlocal cinkeys=0{,0},:,0#,!<c-g>,o,O,e
	augroup END
	" }}}

	" Autocommands for *.html *.cgi {{{
	" Automatic updates date of last modification in HTML files. File must
	" contain line "^\([<space><Tab>]*\)Last modified: ",
	" else will be date writtend on the current " line.
	augroup HtmlCgiPHP
	autocmd!
	" Appending right part of tag in HTML files.
	autocmd BufEnter                 *.phtml	imap <buffer> QQ </><Esc>2F<lywf>f/pF<i
	autocmd BufWritePre,FileWritePre *.phtml	call AutoLastMod()
	autocmd BufEnter                 *.html	imap <buffer> QQ </><Esc>2F<lywf>f/pF<i
	autocmd BufWritePre,FileWritePre *.html	call AutoLastMod()
	autocmd BufEnter                 *.cgi	imap <buffer> QQ </><Esc>2F<lywf>f/pF<i
	autocmd BufWritePre,FileWritePre *.cgi	call AutoLastMod()
	autocmd BufEnter                 *.php	imap <buffer> QQ </><Esc>2F<lywf>f/pF<i
	autocmd BufWritePre,FileWritePre *.php	call AutoLastMod()
	autocmd BufEnter                 *.php3	imap <buffer> QQ </><Esc>2F<lywf>f/pF<i
	autocmd BufWritePre,FileWritePre *.php3	call AutoLastMod()
	augroup END
	" }}}

	" Autocomands for *.tcl {{{
	augroup Tcl
	autocmd!
	autocmd WinEnter            *.tcl	map <buffer> <C-K> :call CallProg()<CR>
	autocmd BufRead,BufNewFile  *.tcl	setlocal autoindent
	augroup END
	" }}}

	" Autocomands for *.txt {{{
	augroup Txt
	autocmd BufNewFile,BufRead  *.txt   setf txt
	augroup END
	" }}}

	" Autocomands for *.tt2 {{{
	augroup Tt2
	autocmd BufNewFile,BufRead  *.tt2   setf tt2
	augroup END
	" }}}
	" *.hs {{{
	augroup hs
	autocmd Bufenter *.hs compiler ghc
	augroup END
	" }}}

	" Autocomands for Makefile {{{
	augroup Makefile
	autocmd!
	autocmd BufEnter            [Mm]akefile*	map <buffer> <C-K> :call CallProg()<CR>
	augroup END
	" }}}

	" Autocomands for GnuPG (gpg) {{{ 
	" Transparent editing of gpg encrypted files.
	" By Wouter Hanegraaff <wouter@blub.net>,
	" enhanced by Lubomir Host 'rajo' <rajo AT platon.sk>
	" 
	augroup GnuPG
		autocmd!

		" First make sure nothing is written to ~/.viminfo while editing
		" an encrypted file.
		" viminfo doesn't have local value, set global value instead
		autocmd BufReadPre,FileReadPre		*.gpg,*.asc set viminfo=
		" We don't want a swap file, as it writes unencrypted data to disk
		autocmd BufReadPre,FileReadPre		*.gpg,*.asc setlocal noswapfile
		" Switch to binary mode to read the encrypted file
		autocmd BufReadPre,FileReadPre		*.gpg,*.asc setlocal bin
		autocmd BufReadPre,FileReadPre		*.gpg,*.asc let ch_save = &ch | setlocal ch=2
		autocmd BufReadPost,FileReadPost	*.gpg,*.asc '[,']!gpg --decrypt -q -a 2>/dev/null
		" Switch to normal mode for editing
		autocmd BufReadPost,FileReadPost	*.gpg,*.asc setlocal nobin
		autocmd BufReadPost,FileReadPost	*.gpg,*.asc let &ch = ch_save | unlet ch_save
		autocmd BufReadPost,FileReadPost	*.gpg,*.asc execute ":doautocmd BufReadPost " . expand("%:r")

		" Convert all text to encrypted text before writing
		autocmd BufWritePre,FileWritePre	*.gpg,*.asc '[,']!gpg --encrypt --default-recipient-self -q -a
		" Undo the encryption so we are back in the normal text, directly
		" after the file has been written.
		autocmd BufWritePost,FileWritePost	*.gpg,*.asc undo
	augroup END
	" }}}

endif " if has("autocmd")
" }}} Autocomands

" Colors {{{
set background=dark
hi StatusLine   term=bold,reverse cterm=bold,reverse
hi StatusLineNC term=reverse      cterm=reverse
hi User1        term=inverse,bold cterm=inverse,bold ctermfg=Red
hi User2        term=bold         cterm=bold         ctermfg=Yellow
hi User3        term=inverse,bold cterm=inverse,bold ctermfg=Blue
hi User4        term=inverse,bold cterm=inverse,bold ctermfg=LightBlue
hi User5        term=inverse,bold cterm=inverse,bold ctermfg=Red       ctermbg=Green
hi Folded       term=standout     cterm=bold         ctermfg=Blue      ctermbg=Black
hi FoldColumn   term=standout                        ctermfg=DarkBlue  ctermbg=Black 
hi Comment      term=bold                            ctermfg=DarkCyan
" Parenthesis checking
hi MatchParen   term=bold         cterm=bold,reverse ctermfg=DarkBlue  ctermbg=Black

" }}}

""call Source(VIMRC_EXTRA.".post")
""call Source(VIMRC_EXTRA."-".user.".post")
""call Source(VIMRC_EXTRA."-".machine.".post")
""call Source(VIMRC_EXTRA."-".machine."-".user.".post")

if exists("g:open_all_win")
	if g:open_all_win == 1
		" Open all windows only if we are not running (g)vimdiff
		if match(v:progname, "diff") < 0
			call OpenAllWin()
		endif
	endif
	" turn g:open_all_win off after opening all windows
	" it prevents reopen windows after 2nd sourcing .vimrc
	let g:open_all_win = 0
endif

hi CursorColumn ctermbg=4

" Modeline {{{
" vim:set ts=4:
" vim600:fdm=marker fdl=0 fdc=3
" }}}

"added by zs
"""{{{
"map <F8> :NERDTreeToggle<CR>.
""map <F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR>
""}}}
set runtimepath +=/usr/share/vim/vim73/phpman
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"
 ""autoload _vimrc
 autocmd! bufwritepost vimrc source %
 ""map <special> <F5> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/python" %<cr>
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
 "set cindent  "使用C语言的缩进
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
 "" here is not comtiable
let php_folding = 1
set ts=4
set expandtab

let g:indentLine_color_term = 239
let g:indentLine_char = '|'
" 自动切换目录为当前编辑文件所在目录
au BufRead,BufNewFile,BufEnter * cd %:p:h

""{{{ neoAutoComplete
"auto start on load
""let g:neocomplcache_enable_at_startup = 1 
""No auto complete when input
let g:NeoComplCache_DisableAutoComplete = 1
let g:SuperTabDefaultCompletionType = '<C-X><C-I>'
let g:neocomplcache_enable_quick_match = 1
" Use camel case completion. 
let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion. 
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
""heary features
if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""}}}


au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

""{{{ PHP Document for Vim
let g:pydiction_location = '$HOME/linuxetc/dicts/zend.dict'
let g:pydiction_menu_height = 20
""}}}
""{{{ Config plugin supertab,这里修改了pydict插件，将其默认的Tab键改为了Shift+Tab键触发，主要是将最方便的Tab键
""{{{ 用到使用最频繁的当前页面匹配补全上，下面两行配置supertab插件，将Tab映射为Ctrl+N键
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-N>"
""}}}
"" php/python/js autocomplete
if has("autocmd")
    autocmd FileType python set complete+=k$HOME/linuxetc/dicts/zend.dict iskeyword+=.,(
""  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS  
endif " has("autocmd") 


" Keybord mappings {{{
"
" backspace fix
noremap 	
inoremap 	
cnoremap 	

" Switching between windows by pressing one time CTRL-X keys.
noremap <C-X> <C-W><C-W>

" Tip from http://vim.sourceforge.net/tips/tip.php?tip_id=173
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_

" Make Insert-mode completion more convenient:
imap <C-L> <C-X><C-L>


set remap
map <C-O><C-O> :split 
imap <C-O><C-O> <Esc>:split 


" Open new window with file ~/.vimrc (ViM configuration file)
map <C-O><C-K> :split ~/.vimrc<CR>
imap <C-O><C-K> <Esc>:split ~/.vimrc<CR>
" Open new window with dir ~/.vim (ViM configuration dir)
map <C-O><C-V> :split ~/.vim<CR>
imap <C-O><C-V> <Esc>:split ~/.vim<CR>

" Safe delete line (don't add line to registers)
":imap <C-D> <Esc>"_ddi
imap <C-D> <Esc>:call SafeLineDelete()<CR>i

" Search for the current Visual selection.
""vmap S y/<C-R>=escape(@",'/\')<CR>
" replace selected text with text in register
""vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

nnoremap <SPACE> <c-g>
nnoremap <S-SPACE> <C-B>
inoremap <c-g> <C-O><c-g>
inoremap <C-B> <C-O><C-B>


" Mappings for folding {{{
" Open one foldlevel of folds in whole file
" Note: 'Z' works like 'z' but for all lines in file
noremap Zo mzggvGzo'z
noremap ZO zR
noremap Zc mzggvGzc'z
noremap ZC zM
noremap Zd mzggvGzd'z
noremap ZD mzggvGzD'z
noremap Za mzggvGza'z
noremap ZA mzggvGzA'z
noremap Zx mzggvGzx'z
noremap ZX mzggvGzX'z
" }}}
" move cursor in insert mode
inoremap <C-J> <C-O>j
inoremap <C-K> <C-O>k
inoremap <C-H> <C-O>h
inoremap <C-L> <C-O>l
" start of line
"noremap <C-A>		i<Home>
inoremap <C-A>		<Home>
cnoremap <C-A>		<Home>
" end of line
noremap <C-E>		i<End>
inoremap <C-E>		<End>

""{{{ PHP Document for Vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR>
""}}}

map <C-c> :s/^/\/\//<Enter>:noh<Enter>
map <C-u> :s/^\/\///<Enter>:noh<Enter>

"" map F2 F3 to enable and disable PHPFold
map <special> <C-H> <esc><S-:>w! %<cr><esc><S-:>! $HOME/linuxetc/showTips.sh <cr>
map <F2> <Esc>:EnableFastPHPFolds<Cr>
map <F3> <Esc>:DisablePHPFolds<Cr>
"" F4 save file
nmap <F4> :w<cr>
"" Ctrl+F5 to check js systax with jslint
"" F5 to check php syntax with php
map <special> <C-F5> <esc><S-:>w! %<cr><esc><S-:>! $HOME/linuxetc/jslint.js %<cr>
map <special> <F5> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/php" -l %<cr>
"" F6 to run current php file
map <special> <F6> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/php" %<cr>
"" F7 to check php format with phpcodesniffer
map <special> <F7> <esc><S-:>w! %<cr><esc><S-:>!"/usr/bin/phpcs" %<cr>
"" F8 previous tab，F9 next tab
nnoremap <silent> <F8> :tabp<CR>
nnoremap <silent> <F9> :tabn<CR>
""Ctrl+F12 to enable/disable cursorLine
nmap <C-F12> :set cursorline!<BAR>set nocursorline?<CR>
"" F12  to  enable/disable cursorColumn 
nmap <F12> :set cursorcolumn!<BAR>set nocursorcolumn?<CR>

" }}}

""{{{ for indent_guide plugin 
""Tips:default toogle key \ig has been changed to \g
let g:indent_guides_auto_colors = 0 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3 
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4 
""}}}

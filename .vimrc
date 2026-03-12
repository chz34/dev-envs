set number
set showmatch
set nocompatible
set autoindent
set smartindent
set hlsearch
set tags=tags
set expandtab
set ts =4
set sw =4
set ruler
syntax on
filetype indent on

map <F12> :e ~/.vimrc <cr>

let mapleader="\<Space>"
map <Leader>h 0
map <Leader>l $


function! Compile()
	exec "w"
	if &filetype == "cpp"
		exec "!g++ -g -o %<.exe % -std=gnu++11 -Wall"
	endif
	if &filetype == "c"
		exec "!gcc -g -o %<.exe % -Wall"
	endif
	if &filetype == "tex" || &filetype == "plaintex" || &filetype == "context"
		exec "!xelatex %"
	endif
	if &filetype == "java"
		exec "!javac %"
	endif
endfunc

function! Run()
	exec "w"
	if &filetype == "cpp" || &filetype == "pascal"
		exec "!%<.exe"
	endif
	if &filetype == "c"
		exec "!%<.exe"
	endif
	if &filetype == "python"
		exec "!python %"
	endif
	if &filetype == "sh"
		exec "!bash %"
	endif
	if &filetype == "tex" || &filetype == "plaintex" || &filetype == "context"
		exec "!start %<.pdf"
	endif
	if &filetype == "html"
		exec "!chrome C:/Users/Administrator/%"
	endif
	if &filetype == "java"
		exec "!java %<"
	endif
endfunc

function! Debug()
	exec "w"
	if &filetype == "cpp" || &filetype == "pascal" ||&filetype == "c"
		exec "!gdb %<"
	endif
	if &filetype == "python"
		exec "!python -m pdb %"
	endif
endfunc

imap<F5> <esc>:call Debug()<cr>
map<F5> <esc>:call Debug()<cr>
vmap<F5> <esc>:call Debug()<cr>

imap<F8> <esc>:call Run()<cr>
map<F8> <esc>:call Run()<cr>
vmap<F8> <esc>:call Run()<cr>

imap<F9> <esc>:call Compile()<cr>
map<F9> <esc>:call Compile()<cr>
vmap<F9> <esc>:call Compile()<cr>

syntax on
filetype plugin indent on

set backspace=indent,eol,start

set number
set relativenumber

set foldmethod=syntax
set nofoldenable

autocmd BufRead,BufNewFile *.tex set filetype=plaintex

" ===Tabs===
set tabstop=4  " show existing tab as 4 spaces
set shiftwidth=4  " when indenting with '>', use 4 space width
" set expandtab  " insert spaces instead of tab
" ===/Tabs===

" ===Trim Trailing Whitespace===
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" ===/Trim Trailing Whitespace===

" ===WQ Capitalization Fix===
command W w
command Q q
command Wq wq
command WQ wq
" ===/WQ Capitalization Fix===

" ===Semicolon to Colon===
nnoremap ; :
" ===/Semicolon to Colon===

" =============
" ===Plugins===
" =============

execute pathogen#infect()

" ===vim-airline===
" ===/vim-airline===

" ===vim-airline-themes===
let g:airline_theme='bubblegum'
" ===/vim-airline-themes===

" ===vim-gitgutter===
set updatetime=100
" ===/vim-gitgutter===

" ===Syntastic===
" ===/Syntastic===

" ===Nim.vim===
fun! JumpToDef()
	if exists("*GotoDefinition_" . &filetype)
		call GotoDefinition_{&filetype}()
	else
		exe "norm! \<C-]>"
	endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
" ===/Nim.vim===

" ==============
" ===/Plugins===
" ==============


" Sets indents count.
function! SetIndentsCount(n)
	execute "set shiftwidth=".a:n
	execute "set softtabstop=".a:n
	execute "set tabstop=".a:n
endfunction

" Show numbers of lines.
set number

" Enable syntax highlighting.
syntax on

" Hightling search results.
set hlsearch

" Search while typing search request.
set incsearch

" Use UTF-8 as default encoding.
set termencoding=utf8
set encoding=utf8

" Nocompatible to Vi settins.
set nocompatible

" Show cursor placement all the time.
set ruler

" Mouse support.
set mouse=a
set mousemodel=popup

" Autoindents.
set autoindent

" Don't wrap lines.
set nowrap

" Smart indents.
set smartindent

" Show not finished commands in the status bar.
set showcmd

" indents filding.
set foldenable
set foldlevel=100
set foldmethod=indent

" Dont't clear buffer on switch.
set hidden

" make command line height equal to 1.
set ch=1

" Set default indesnts count.
call SetIndentsCount(2)
set expandtab

" Indents exceptions equal to 2.
autocmd FileType java call SetIndentsCount(4)
autocmd FileType kt call SetIndentsCount(4)

" Force use tabs in make files
autocmd FileType make setlocal noexpandtab

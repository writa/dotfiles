set nocompatible              
filetype off


if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
let g:neocomplcache_enable_at_startup = 1

filetype plugin indent on 
filetype indent on
syntax on

" go
au BufRead,BufNewFile *.go set filetype=go
if $GOROOT != ''
	set rtp+=$GOROOT/misc/vim
endif

set number


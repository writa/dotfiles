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

filetype indent on
filetype plugin on
syntax on

" line number
set number

" search
set hlsearch
set incsearch

" ESC,ESCでハイライトoff
nnoremap  <silent><Esc><Esc> :<C-u>set nohlsearch<Return>

" 「/」「?」「*」「#」が押されたらハイライトをON
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?                
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
"ビジュアルモードの選択テキストをクリップボードに
set clipboard+=autoselect

" 自動コメントアウト防止
autocmd FileType * set formatoptions-=ro

" 大文字小文字無視
set ignorecase 

" 編集中でも他のファイルを開けるようにする
set hidden

" 検索などで飛んだらそこを真ん中に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

"usキーボードで使いやすく
nmap ; :


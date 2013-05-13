filetype off


if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'davidoc/taskpaper.vim'
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
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G Gzz

" usキーボードで使いやすく
nnoremap ; :
nnoremap : ;

" vimgrepで検索したさいの設定
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

filetype off

" gocode
set rtp+=$GOROOT/misc/vim
" golint
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet' 
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'QuickBuf'
NeoBundle 'ack.vim'
NeoBundle 'liquidz/lein-vim'
NeoBundle 'slimv.vim'
NeoBundle 'bling/vim-airline'
"NeoBundle 'vim-scripts/VimClojure.git'
" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" js BDDツール
NeoBundle 'claco/jasmine.vim'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'digitaltoad/vim-jade.git'
NeoBundle 'rking/ag.vim'
"NeoBundle 'wellle/tmux-complete.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'Blackrush/vim-gocode'

let g:neocomplcache_enable_at_startup = 1


" line number
set number

" search
set hlsearch
set incsearch

" ESC,ESCでハイライトoff
nnoremap  <silent><Esc><Esc> :<C-u>set nohlsearch<Return>

" 「/」「?」「*」「#」が押されたらハイライトをON
nnoremap / :<C-u>set hlsearch<Return> /
nnoremap ? :<C-u>set hlsearch<Return> ?                
nnoremap * :<C-u>set hlsearch<Return> *
nnoremap # :<C-u>set hlsearch<Return> #

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
"ビジュアルモードの選択テキストをクリップボードに
set clipboard+=autoselect

" 自動コメントアウト防止
autocmd FileType * set formatoptions-=ro

" 大文字小文字無視 set ignorecase 

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
"nnoremap ; :
"nnoremap : ;

" vimgrepで検索したさいの設定
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" nnoremap ,p :Import 
" nnoremap ,P :ImportAs 
" nnoremap <silent>,f :Fmt<Enter>

nnoremap ,f :NERDTreeToggle<Enter>
nnoremap ,c :NERDTreeFind<Enter>

" Visual mode で選択したテキストを検索する
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

set completeopt=menu,preview

let g:qb_hotkey = ",b"
let g:NERDTreeWinSize = 60

syntax enable
set background=dark
colorscheme solarized

" slimv
let g:paredit_mode=0

"let vimclojure#WantNailgun = 1
"let vimclojure#NailgunClient = $HOME/bin/ng
"let g:vimclojure#HighlightBuiltins = 1

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd FileType scala     setlocal sw=2 sts=2 ts=2 et

filetype indent on
filetype plugin on
syntax on

" golang
auto BufWritePre *.go Fmt

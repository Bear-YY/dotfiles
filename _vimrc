"vim settings
set nocompatible " VI 互換でない
set nobackup " バックアップはとらない
set noswapfile "スワップファイルを作らな
set noundofile "undoファイルを作らない
set laststatus=2 " 常にステータスを表示
set showmode " モードを表示
set ruler " ルーラーを表示
set showcmd " 打ったキーを表示
set backspace=indent,eol,start " 挿入開始以前の文字や改行も削除
set whichwrap=b " カーソル移動で行を越えて移動させるか
set showmatch " 括弧の対応の表示
set ignorecase " 検索時大文字と小文字を区別しない
set smartcase "大文字を含んだ検索では、ignorecaseを上書きする
set incsearch " インクリメンタルサーチ
set number " 行番号を表示
set relativenumber 
set termguicolors
set hlsearch
set gfn=ＭＳ_ゴシック:h10:cSHIFTJIS
set lines=45
set columns=120
set iminsert=0 " インサートモードで日本語入力を ON にしない
set imsearch=0 " 検索モードで日本語入力を ON にしない
set encoding=utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
syntax on " シンタックスハイライト
filetype plugin indent on " ファイルタイプを自動検出、ファイルタイプ用のプラグインとインデント設定を自動読み込みする

"tab and indent
" タブの代わりに空白文字を挿入する
set expandtab
" タブ文字の表示幅
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

"vimgrepを使ったとき自動でQuickfix-windowが立ち上がる
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep tab cwindow

"leader and keybindings
let mapleader = "\<Space>"
noremap <Leader>l $
noremap <Leader>m %
nnoremap <Leader>a ggVG
nnoremap <Leader>w :<C-u>w<CR>
nnoremap <Leader>q :<C-u>q<CR>
nnoremap <Leader>z :nohlsearch<CR>
"Ctrl+Vの挙動を変更
nmap <C-v> <C-v> 
cmap <C-v> <C-v> 
"jjと入力するとインサートモードから通常モードになる
inoremap <silent> jj <ESC>
noremap <C-j> 10j
noremap <C-k> 10k
"Quickfix-window
map <silent> <C-p> :<C-u>cprev<CR>
map <silent> <C-n> :<C-u>cnext<CR>

"colorScheme settings
colorscheme elly
let g:lightline = {
      \ 'colorscheme': 'elly',
      \ }
let g:airline_theme='elly'

"Plugins settings

"easymotion settings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"NERDTree settings
map <C-e> :NERDTreeToggle<CR>

"emment-vim
let g:user_emmet_leader_key='<c-t>'
"展開をtabキーでできるように設定
autocmd FileType html,css,scss,php imap <buffer><expr><tab>
    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
    \ "\<tab>"

"vim-plugを入れてなければ読み込む
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"installPlugins :open vim =>type[PlugInstall] on exmode
" 保存する場所を定義 この例だと~/.vim/plugged
call plug#begin('~/.vim/plugged')
" 実際にはここに追加したいプラグインをどんどん追加していきます。
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'ulwlu/elly.vim'
Plug 'itchyny/lightline.vim'
Plug 'cohama/lexima.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
" Initialize plugin system
call plug#end()

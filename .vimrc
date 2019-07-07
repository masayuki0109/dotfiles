"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 入力モード解除
inoremap <silent> jj <ESC>

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" u
" シンタックスハイライトの有効化
syntax enable
" □や○文字が崩れる問題を解決
set ambiwidth=double 
" iterm2用
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" スペース・タブ可視化
set list
set listchars=tab:\▸\-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set tags+=~/.tags
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" マウスモード有効
set mouse=a

" 履歴系
set history=200
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" ペースト
nnoremap <Space>p "0p
vnoremap <Space>p "0p
" クリップボードへ
nnoremap <C-y> "*y
vnoremap <C-y> "*y
onoremap <C-y> "*y
" 移動
noremap <S-h>   ^
noremap <S-l>   $

" 削除有効化
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" ruby用プラグイン
Plug 'vim-ruby/vim-ruby'
" html保管
Plug 'mattn/emmet-vim'
"シンタックスエラーチェック
Plug 'scrooloose/syntastic'
"テキストオブジェクト拡張
Plug 'tpope/vim-surround'
" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  " Plug 'fishbullet/deoplete-ruby'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" rails系
Plug 'tpope/vim-rails'
" インデント
Plug 'Yggdroot/indentLine'
" 検索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jremmen/vim-ripgrep'

" スペルチェック
Plug 'kamykn/spelunker.vim'
call plug#end()
""""""""""""""""""""""""""""""

" スペルチェック
set nospell

""""""""""""""""""""""""""""""
" fzf設定
""""""""""""""""""""""""""""""
" like Spacemacs
let mapleader = "\<Space>"

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>x :Commands<CR>
noremap <C-F> :GFiles<CR>
noremap <C-N> :GFiles?<CR>
" nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>k :bd<CR>
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})
nnoremap <Leader>r :FZFMru<CR>

""""""""""""""""""""""""""""""
" ripgrep設定
""""""""""""""""""""""""""""""
nnoremap <C-g> :Rg<Space>

""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" deoplete設定
""""""""""""""""""""""""""""""
" 起動時に有効
let g:deoplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:deoplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:deoplete#auto_complete_start_length = 3
" 区切り文字まで補完する
let g:deoplete#enable_auto_delimiter = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> deoplete#smart_close_popup()."<C-h>"
""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""
" syntastic設定
""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""
" NeoSnippet設定
""""""""""""""""""""""""""""""
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip
""""""""""""""""""""""""""""""


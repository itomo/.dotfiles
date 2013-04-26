"-----------------------------
" display
"-----------------------------
" タイトルをウインドウ枠に表示する
set title

"バイナリファイルの非印字可能文字を16進数で表示
set display=uhex

" 行番号を表示する
set number
" ルーラーを表示
set ruler
set shortmess+=I

" 入力中のコマンドをステータスに表示する
set showcmd
"コマンドラインに使われるスクリーン上の行数
set cmdheight=1

"カーソルの上または下に表示する最小限の行数
set scrolloff=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set laststatus=2
" ステータスラインの色
highlight StatusLine term=bold cterm=bold ctermfg=black ctermbg=white

" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2

" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" fileencodings の設定を前から順に試してはじめにマッチしたものが採用される
set fileencodings=utf-8,euc-jp,iso-2022-jp,utf-8,cp932
" fileencoding=utf-8で編集中、□や○があるとその行でカーソル位置がずれる問題があったのだが、解決する設定（ambiwidth=double）
if &encoding == 'utf-8'
set ambiwidth=double
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
endif

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" ---indent---
" オートインデントを有効にする（新しい行のインデントを現在の行と同じにする）
set autoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使う
set expandtab

"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  filetype plugin indent on     " Required!

  " Installation check.
  if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
  endif

"GitHubリポジトリにあるプラグインを利用場合
NeoBundle 'tpope/vim-fugitive'

"GitHub以外のGitリポジトリにあるプラグインを利用する場合
NeoBundle 'git://git.wincent.com/command-t.git'

"Git以外のリポジトリにあるプラグインをを利用する場合
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

"Cake PHP"
syntax on
au BufRead,BufNewFile *.ctp set filetype=php

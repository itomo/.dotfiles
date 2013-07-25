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

"Backspace"
set backspace=start,eol,indent

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

" 折りたたみを有効
set foldenable
" マーカーで折りたたみ
set foldmethod=marker
" カーソルが移動した時に自動で折りたたみを開く
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
" 折りたたみの具合
set foldlevel=0
" 最大折りたたみ深度$
set foldnestmax=3
" 左側に折りたたみガイド表示$
set foldcolumn=2
hi FoldColumn gui=bold term=standout ctermbg=black ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
"折り畳みの色
hi Folded gui=bold term=standout ctermbg=black ctermfg=DarkBlue guibg=Grey30 guifg=Grey80

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" fileencodings の設定を前から順に試してはじめにマッチしたものが採用される
set fileencodings=utf-8,euc-jp,iso-2022-jp,utf-8,cp932
set encoding=utf-8
set fileformats=unix,dos,mac

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
"set expandtab
" タブなどの可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
	syntax on

	" PODバグ対策
	syn sync fromstart

	function! ActivateInvisibleIndicator()
		# 下の行の"　"は全角スペース
		syntax match InvisibleJISX0208Space "　" display containedin=ALL
		highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
		"syntax match InvisibleTrailedSpace "[\t]\+$" display containedin=ALL
		"highlight ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
		"syntax match InvisibleTab "\t" display containedin=ALL
		"highlight InvisibleTab	term=underline ctermbg=white gui=undercurl guisp=darkslategray
	endfunction

	augroup	invisible
		autocmd! invisible
		autocmd	BufNew,BufRead * call ActivateInvisibleIndicator()
	augroup END
endif

"Cake PHP"
syntax on
au BufRead,BufNewFile *.ctp set filetype=php

set nocompatible               " be iMproved
filetype off

if has('vim_starting')
	set runtimepath+=~/.dotfiles/.vim/neobundle.vim
	call neobundle#rc(expand('~/.dotfiles/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'git@git.gree-dev.net:takafumi-hirata/unite-aoi.git'
NeoBundle 'joonty/vdebug'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on


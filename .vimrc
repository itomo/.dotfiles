"-----------------------------
" display
"-----------------------------
" タイトルをウインドウ枠に表示する
set title

"バイナリファイルの非印字可能文字を16進数で表示
set display=uhex

" Backupファイルを作らない。
set nowritebackup
set nobackup
set noswapfile

" 行番号を表示する
set number
" ルーラーを表示
set ruler
set shortmess+=I

"検索設定
set ignorecase

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
"折りたたみ文字変更 {{{,}}}で都合の悪いもの
au BufRead,BufNewFile *.tpl set foldmarker=<<<,>>>

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
set expandtab
" タブなどの可視化
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
",eol:↲" 全角スペース・行末のスペース・タブの可視化,改行は邪魔だったのでコメントアウト

if has("syntax")
    syntax on

    " PODバグ対策
    syn sync fromstart

    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
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

" tab
" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
function! s:my_tabline()  "{{{
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
    " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>

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
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'joonty/vdebug'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

"   辞書ファイル
autocmd BufRead *.php\|*.ctp :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 0
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_smart_case = 0
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

"   いろいろ色
"   何色が出るか確認    :so $VIMRUNTIME/syntax/colortest.vim
"   現在ルールの確認    :so $VIMRUNTIME/syntax/hitest.vim
hi Todo term=bold ctermfg=brown ctermbg=darkgray
hi DiffChange term=bold ctermfg=lightred ctermbg=darkgray
hi SpellRare term=bold ctermfg=red ctermbg=darkgray
hi Pmenu ctermfg=white ctermbg=black
hi PmenuSel ctermfg=darkred ctermbg=black

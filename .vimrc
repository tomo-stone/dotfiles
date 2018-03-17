" Vundleプラグインマネージャ
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' 
" 導入したいプラグインを以下に列挙 
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter' 
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'

call vundle#end() 
filetype plugin indent on

" 見た目
syntax on
set number
set cursorline
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" カラースキーム
colorscheme evening
" 透過背景にする
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

" テキスト編集
set tabstop=2
set shiftwidth=2
set noexpandtab
set softtabstop=0
set encoding=utf-8
set fileencoding=utf-8

" クリップボード
set guioptions+=a

" カーソル位置の保存
if has("autocmd") 
	autocmd BufReadPost * 
	\ if line("'\"") > 0 && line ("'\"") <= line("$") | 
	\ exe "normal! g'\"" |  
	\ endif 
endif

" 検索・補完
set wildmenu
set incsearch
set ignorecase

" markdownのハイライトを有効にする 
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Golang関連(vim-go plugin)
let g:go_highlight_functions = 1
let g:go_highlight_method = 1
let g:go_highlight_structs = 1

autocmd FileType go :highlight goErr cterm =bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/


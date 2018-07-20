set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'scrooloose/nerdtree'
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'jlanzarotta/bufexplorer'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'ervandew/supertab'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'godlygeek/tabular'
  Plugin 'edkolev/tmuxline.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-endwise'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'tpope/vim-projectionist'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-rake'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'wikitopian/hardmode'
  Plugin 'epeli/slimux'
  Plugin 'alvan/vim-closetag'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'rainerborene/vim-reek'
call vundle#end()

syntax on
filetype plugin indent on

set encoding=utf-8
set relativenumber
set number
set mouse=a
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 expandtab
set background=dark
set term=screen-256color
set cursorline
set colorcolumn=100
set showcmd
set hlsearch
set incsearch

colorscheme railscasts

map <Leader>n <plug>NERDTreeTabsToggle<CR>    "NERDTree in new tabe
let g:nerdtree_tabs_open_on_console_startup=1 "automaticly opens NERDTree when enter vim
let NERDTreeShowHidden=1

let indent_guides_auto_colors=0
let indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup=1

"let g:airline#extensions#tabline#enabled=1
let g:airline_theme='base16_railscasts'

fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd BufRead,BufNewFile *.axlsx set filetype=ruby

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

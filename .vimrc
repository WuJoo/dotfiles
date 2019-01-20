set nocompatible
filetype off

set shell=bash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'ervandew/supertab'
  Plugin 'godlygeek/tabular'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-endwise'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'alvan/vim-closetag'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'pangloss/vim-javascript'

  "Plugin 'edkolev/tmuxline.vim'
  "Plugin 'vim-syntastic/syntastic'
  "Plugin 'wikitopian/hardmode'
  "Plugin 'epeli/slimux'
  "Plugin 'lervag/vimtex'
call vundle#end()

syntax on
filetype plugin indent on

"set paste
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

"show hidden files in NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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

"F2 shortcut for NERDTree
nmap <F2> :NERDTreeTabsToggle<CR>

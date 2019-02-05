set shell=/bin/bash

set nocompatible
filetype off


"""" PLUGINS
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
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'w0rp/ale'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'chrisbra/csv.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'kshenoy/vim-signature'
  Plugin 'junegunn/vim-peekaboo'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'mileszs/ack.vim'
  Plugin 'takac/vim-hardtime'

  "Plugin 'DavidEGx/ctrlp-smarttabs'
  "Plugin 'edkolev/tmuxline.vim'
  "Plugin 'epeli/slimux'
  "Plugin 'lervag/vimtex'
call vundle#end()

syntax on
filetype plugin indent on


""" BASIC SETTINGS
set encoding=utf-8              " set encoding to UTF-8
set mouse=a                     " enable mouse

set number                      " show line number
set relativenumber              " relative line numbering for lines other than current
set cursorline                  " highlight current line
set colorcolumn=120             " highlight 120. column
set showmatch                   " highlight matching parentheses / brackets [{()}]
set lazyredraw                  " redraw screen only when we need to
set showcmd                     " show typed keys
set visualbell                  " blink cursor on error, instead of beeping

set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches

set tabstop=2                   " number of spaces per <TAB>
set expandtab                   " convert <TAB> key-presses to spaces
set shiftwidth=2                " set a <TAB> key-press equal to 4 spaces

set autoindent                  " copy indent from current line when starting a new line
set smartindent                 " even better autoindent (e.g. add indent after '{')'}')

set background=dark             " configure Vim to use brighter colors
set autoread                    " autoreload the file in Vim if it has been changed outside of Vim

set backspace=indent,eol,start
set term=screen-256color

set clipboard=unnamed

if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" set paste

""" CUSTOM KEY BINDINGS

"move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


""" COLORS
colorscheme monochrome           "other: railscasts monokai ubloh railscasts
highlight ColorColumn ctermbg=7  "colorcolumn color

""" PLUGINS SETTINGS


""" NERDTree
nmap <F2> :NERDTreeTabsToggle<CR>       " F2 shortcut for NERDTree

let NERDTreeShowHidden=1                " show hidden files in NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"


""" vim-indent-guides
let indent_guides_auto_colors=0
let indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup=1  " enable indent guides on startup

let g:airline#extensions#tabline#enabled=1
let g:airline_theme='monochrome'             " other: 'base16_railscasts'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


""" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


""" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"let g:ctrlp_extensions = ['smarttabs']

""" vim-gitgutter
let g:SignatureMarkTextHLDynamic = 1  " vim gitgutter and vim signature lives together
let g:gitgutter_enabled = 0           " disable gitgutter by default

"""" vim-hardtime
nmap <F1> :HardTimeToggle<CR>       " F1 shortcut for hardtime toggle
let g:hardtime_default_on = 1       " hardtime enabled by default

""" CUSTOM FUNCTIONS


""" function for trimming whitespaces

fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace() " call TrimWhitespace on save

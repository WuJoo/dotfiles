set shell=/bin/bash

set nocompatible
filetype off


"""" PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'                       " best plugin manager

  """ Programming languages support
  Plugin 'vim-ruby/vim-ruby'                          " better ruby support
  Plugin 'pangloss/vim-javascript'                    " better js support

  """ Better productivity
  Plugin 'takac/vim-hardtime'                         " avoid hjkl
  Plugin 'godlygeek/tabular'                          " aligning assignments
  Plugin 'tpope/vim-endwise'                          " smart do end blocks in ruby
  Plugin 'alvan/vim-closetag'                         " closing html tags
  Plugin 'jiangmiao/auto-pairs'                       " inserting brackets in pairs

  """ Vim as IDE
  Plugin 'mileszs/ack.vim'                            " integration with ack searching(better grep in vim)
  Plugin 'w0rp/ale'                                   " asynchronous linting
  Plugin 'ervandew/supertab'                          " tab completion in insert mode
  Plugin 'scrooloose/nerdtree'                        " file tree
  Plugin 'kshenoy/vim-signature'                      " showing marks next to line number
  Plugin 'junegunn/vim-peekaboo'                      " better support for registers
  Plugin 'tpope/vim-fugitive'                         " git wrapper
  Plugin 'airblade/vim-gitgutter'                     " show git diff in vim

  """ Prettier Vim
  Plugin 'nathanaelkane/vim-indent-guides'            " coloring indentations
  Plugin 'vim-airline/vim-airline'                    " airline statusline
  Plugin 'vim-airline/vim-airline-themes'             " themes for airline statusline
  Plugin 'cocopon/iceberg.vim'                        " iceberg colorscheme
  Plugin 'flazz/vim-colorschemes'                     " useful to checking different colorschemes

  """ Other
  Plugin 'mechatroner/rainbow_csv'                    " betters colors and queries for .csv files
  Plugin 'mhinz/vim-startify'                         " custom start screen

  "Plugin 'edkolev/tmuxline.vim'
  "Plugin 'epeli/slimux'
  "Plugin 'lervag/vimtex'
call vundle#end()

syntax on
filetype plugin indent on


set encoding=utf-8                                    " set encoding to UTF-8
set mouse=a                                           " enable mouse

set number                                            " show line number
set relativenumber                                    " relative line numbering for lines other than current
set cursorline                                        " highlight current line
set colorcolumn=120                                   " highlight 120. column
set showmatch                                         " highlight matching parentheses / brackets [{()}]
set lazyredraw                                        " redraw screen only when we need to
set showcmd                                           " show typed keys
set visualbell                                        " blink cursor on error, instead of beeping

set incsearch                                         " search as characters are entered
set hlsearch                                          " highlight matches

set tabstop=2                                         " number of spaces per <TAB>
set expandtab                                         " convert <TAB> key-presses to spaces
set shiftwidth=2                                      " set a <TAB> key-press equal to 4 spaces

set autoindent                                        " copy indent from current line when starting a new line
set smartindent                                       " even better autoindent (e.g. add indent after '{')'}')

set background=dark                                   " configure Vim to use brighter colors
set autoread                                          " autoreload the file in Vim if it has been changed outside of Vim

set backspace=indent,eol,start
set term=screen-256color

set clipboard=unnamed

if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

let mapleader = ","                                   " , as leader


""" Colors
silent! colorscheme iceberg                          " other colorschemes: monochrome monokai ubloh railscasts
                                                     " when colorscheme is missing error is silent


""" NERDTree
nmap <F2> :NERDTreeToggle<CR>|                        " F2 shortcut for NERDTree

let NERDTreeShowHidden=1                              " show hidden files in NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeQuitOnOpen = 1                            " quit nerdtree when opening file
let NERDTreeAutoDeleteBuffer = 1                      " remove buffer with deleted file automaticly


""" vim-indent-guides
let indent_guides_auto_colors=0
let indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=237
let g:indent_guides_enable_on_vim_startup=1           " enable indent guides on startup


""" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='iceberg'
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


""" fzf
nmap <c-p> :FZF<CR>|                                  " ctrl-p shortcut for fzf


""" ack.vim
nmap <Leader>a :Ack<Space>|                          " <Leader>a shortcut for ack
let g:ackprg = 'ag --nogroup --nocolor --column'     " use silver searcher instead of ack


""" vim-gitgutter
let g:SignatureMarkTextHLDynamic = 1                  " vim gitgutter and vim signature lives together
let g:gitgutter_enabled = 0                           " disable gitgutter by default


""" vim-hardtime
nmap <F3> :HardTimeToggle<CR>|                        " F3 shortcut for hardtime toggle
let g:hardtime_default_on = 0                         " hardtime disabled by default
let g:hardtime_ignore_buffer_patterns = ["NERD.*"]    " disable hardtime for NERDTree


""" rainbow_csv
let g:rcsv_colorpairs = [['red', 'red'], ['blue', 'blue'], ['green', 'green'], ['magenta', 'magenta'], ['NONE', 'NONE'], ['darkred', 'darkred'], ['darkblue', 'darkblue'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta'], ['darkcyan', 'darkcyan']] " colors for csv file columns


""" trimming whitespaces

fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()          " trimming whitespaces on save

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.rb 0r ~/.vim/templates/skeleton.rb
  augroup END
endif                                                 " template for new ruby files


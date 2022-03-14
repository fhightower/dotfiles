set nocompatible              " be iMproved, required
filetype off                  " required

" nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'preservim/nerdtree'
  Plugin 'jamestthompson3/nvim-remote-containers'
call vundle#end()            " required
filetype plugin indent on    " required

" open Nerdtree automatically (https://stackoverflow.com/a/36882670/6804636)
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]

let mapleader = " "
map <leader>a :wincmd h<CR>
map <leader>; :wincmd l<CR>


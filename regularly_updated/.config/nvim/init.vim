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
call vundle#end()            " required

filetype plugin indent on    " required

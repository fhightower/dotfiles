" nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

" open Nerdtree automatically (https://stackoverflow.com/a/36882670/6804636)
" and focus on the file pane
" au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0] | execute ':wincmd l'

let mapleader = ' '

" create mappings to open nerdtree
nnoremap <leader>n <cmd>NERDTreeToggle<cr>
" create mappings to make it easy to switch to and from Nerdtree window
nnoremap <leader>a :wincmd h<cr>
nnoremap <leader>; :wincmd l<cr>

" find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" MISC MAPPINGS TO MAKE LIFE EASIER
" add command to open previous file
nnoremap <leader>b <cmd>e#<cr>

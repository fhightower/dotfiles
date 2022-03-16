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
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]

let mapleader = ' '

" create mappings to make it easy to switch to and from Nerdtree window
map <leader>a :wincmd h<CR>
map <leader>; :wincmd l<CR>

" find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


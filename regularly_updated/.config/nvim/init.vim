set exrc " use local neovim configs if present
set noerrorbells " goes without saying...

set tabstop=4 softtabstop=4 " default indentation is four spaces w/ tabs being converted to 4 spaces as well
set shiftwidth=4 " sets number of spaces used for each indent
set smartindent

set ignorecase " ignore case when searching...
set smartcase " ... unless search has upper-case char. in it

set scrolloff=11 " scroll once I am 11 chars. from the end of the file

set wildmode=list " list command line completion options
set wildmenu " command-line completion shows a list of matches

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

let mapleader = ' '

" Create mappings to open nerdtree
nnoremap <leader>n <cmd>NERDTreeToggle<cr>

" Create mappings for navigating windows
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>
nnoremap <leader>wl :wincmd l<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" MISC MAPPINGS TO MAKE LIFE EASIER... most (except really common ones) are prefixed with `m` to set them apart
" Add command to open previous file
nnoremap <leader>b <cmd>e#<cr>
" Pressing <esc> clears search highlighting
nnoremap <esc> :noh<return><esc>

" Add command to turn off line numbering
" credit: https://stackoverflow.com/questions/32306604/how-to-turn-off-vim-relativenumber-setting
function! NumberToggle()
  if(&rnu == 1)
    set nonu nornu
  else
    set nu rnu
  endif
endfunc
nnoremap <leader>mn <cmd>:call NumberToggle()<cr>

augroup CUSTOM_STUFF
	" Removes all listeners in this group and re-attaches them
	autocmd!
	" Remove trailing whitespace
	autocmd BufWritePre * : execute ':%s/\s\+$//e'
augroup END


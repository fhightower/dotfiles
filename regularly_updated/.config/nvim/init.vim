set exrc " use local neovim configs if present
set noerrorbells " goes without saying...

set tabstop=4 softtabstop=4 " default indentation is four spaces w/ tabs being converted to 4 spaces as well
set shiftwidth=4 " sets number of spaces used for each indent
set smartindent
set expandtab

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

set ignorecase " ignore case when searching...
set smartcase " ... unless search has upper-case char. in it

set scrolloff=11 " scroll once I am 11 chars. from the end of the file

set wildmode=list " list command line completion options
set wildmenu " command-line completion shows a list of matches

" spell languages
set spelllang=en_us
" limit number of spellcheck suggestions shown
set spellsuggest=best,7
" treat components of a camelCasedWord as different words
set spelloptions=camel

" Allow mouse to copy as expected on mac
set mouse=r

call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/vim-plug'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" REQUIREMENTS FOR NVIM-CMP (see https://github.com/hrsh7th/nvim-cmp/#recommended-configuration)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" SNIPPETS
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
Plug 'honza/vim-snippets'

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
" There is a query provided here b/c some lsp clients (pyright) requires a query
nnoremap <leader>fl <cmd>Telescope lsp_workspace_symbols query=a<cr>

" Mappings to jump around
noremap <leader>jd <cmd>lua require"telescope.builtin".lsp_definitions()<CR>
noremap <leader>jr <cmd>lua require"telescope.builtin".lsp_references()<CR>

" <MAPPINGS FOR LUA-SNIP>
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

lua require("luasnip.loaders.from_snipmate").lazy_load()
" </MAPPINGS FOR LUA-SNIP>

" MISC MAPPINGS TO MAKE LIFE EASIER... most (except really common ones) are prefixed with `m` to set them apart
" Add command to open previous file
nnoremap <leader>b <cmd>e#<cr>
" Pressing <esc> clears search highlighting
nnoremap <esc> :noh<return><esc>
" Indent the entire file and then return to the line from which this command was called
nnoremap <leader>mi gg<cr>=G<cr>``<cr>
" Toggle spelling
nnoremap <leader>msp <cmd>:set spell!<cr>

" Add command to turn off line numbering
" credit: https://stackoverflow.com/questions/32306604/how-to-turn-off-vim-relativenumber-setting
function! NumberToggle()
  if(&rnu == 1)
    set nonu nornu
  else
    set nu rnu
  endif
endfunc
" This is noremap so this works in normal and visual modes (and others)
noremap <leader>mn <cmd>:call NumberToggle()<cr>

augroup CUSTOM_STUFF
	" Removes all listeners in this group and re-attaches them
	autocmd!
	" Remove trailing whitespace
	autocmd BufWritePre * : execute ':%s/\s\+$//e'
augroup END

" import lua files as I port to lua
lua require'fun'
lua require'lsp-clients'
lua require'telescope-config'


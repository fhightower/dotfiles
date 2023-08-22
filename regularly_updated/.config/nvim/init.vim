set exrc " use local neovim configs if present
set noerrorbells " goes without saying...

set tabstop=4 softtabstop=4 " default indentation is four spaces w/ tabs being converted to 4 spaces as well
set shiftwidth=4 " sets number of spaces used for each indent
set smartindent
set expandtab

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=1000

set ignorecase " ignore case when searching...
set smartcase " ... unless search has upper-case char. in it

set scrolloff=999 " keep the cursor in the middle of the screen (except at beginning and end of files)

set wildmode=list " list command line completion options
set wildmenu " command-line completion shows a list of matches

" spell languages
set spelllang=en_us
" limit number of spellcheck suggestions shown
set spellsuggest=best,3
" treat components of a camelCasedWord as different words
set spelloptions=camel

" Allow mouse to copy as expected on mac
set mouse=r

" This reverts odd telescope behaviour as noted here:
" https://vi.stackexchange.com/questions/39078/wrong-colors-in-of-telescope-window
" And here:
" https://github.com/nvim-telescope/telescope.nvim/issues/2145
hi! link NormalFloat Normal

call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/vim-plug'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kperath/dailynotes.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" REQUIREMENTS FOR NVIM-CMP (see https://github.com/hrsh7th/nvim-cmp/#recommended-configuration)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" SNIPPETS
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

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
noremap <leader>jd <cmd>lua require"telescope.builtin".lsp_definitions()<CR>zz
noremap <leader>jr <cmd>lua require"telescope.builtin".lsp_references()<CR>zz
" The mappings below provide the same mappings above for go files (which use
" vim-go)
autocmd FileType go noremap <leader>jd <Plug>(go-def)
autocmd FileType go noremap <leader>jr <Plug>(go-referrers)

" <MAPPINGS FOR LUA-SNIP>
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
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

" Exit insert mode when certain chars are repeated
inoremap jj <ESC>
inoremap kk <ESC>
inoremap bb <ESC>
inoremap ww <ESC>

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

" Center cursor (zz) when using C-d and C-u and some other commands
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap n nzz
noremap N Nzz
noremap G Gzz
" These aren't necessary b/c scrolloff is so high, but they are nice b/c they keep things centered when navigating near the bottom of a file
nnoremap k kzz
nnoremap j jzz

" Where have you been all my life... paste the item in the default register
" over the selected text while keeping the pasted item in the default
" register.
" It does this by deleting the selected text to the black-hole register ("_)
" and then pasting the text from the default register so it remains the
" unchanged.
xnoremap <leader>p "_dP
" END MISC MAPPINGS TO MAKE LIFE EASIER

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
lua require'general'
lua require'lsp-clients'
lua require'telescope-config'


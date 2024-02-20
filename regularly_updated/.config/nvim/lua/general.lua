-- vim.o.background = "dark"
-- vim.cmd([[colorscheme gruvbox]])

require "dailynotes".setup({
    path = '~/notes/'
})

require('telescope').setup{
    defaults = {
        layout_strategy = 'vertical',
        layout_config = { preview_cutoff = 0 },
    },
}

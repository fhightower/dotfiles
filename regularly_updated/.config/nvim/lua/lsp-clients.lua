-- Setup nvim-cmp.
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently, explicitly selected item
        ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item (or the first one if none are selected).
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Load snippets from custom locations
-- This path has to be relative to the init.vim
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

-- Load snippets from plugins
require("luasnip.loaders.from_vscode").lazy_load()

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
-- old and not sure if valid: local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- lsp configs from https://github.com/hrsh7th/vscode-langservers-extracted
require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
require'lspconfig'.eslint.setup {
  capabilities = capabilities,
}
require'lspconfig'.solargraph.setup{
  capabilities = capabilities,
}
require'lspconfig'.emmet_ls.setup{
  capabilities = capabilities,
}

local on_attach_ruff = function(client, bufnr)
  -- Disable hover in favor of Pyright
  client.server_capabilities.hoverProvider = false
end

require('lspconfig').ruff_lsp.setup {
    on_attach = on_attach_ruff,
    capabilities = capabilities,
}

require'lspconfig'.pyright.setup{
  capabilities = capabilities
}

require'lspconfig'.volar.setup{
  filetypes = {'javascript', 'vue'},
  capabilities = capabilities
}

require'lspconfig'.tsserver.setup{
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

require('gitsigns').setup()

-- Tell vim-go to use gopls
-- let g:go_def_mode='gopls'
-- let g:go_info_mode='gopls'

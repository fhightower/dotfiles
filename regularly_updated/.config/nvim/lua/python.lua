-- Ruff
vim.cmd([[command! RuffFormat :!ruff format %]])
vim.cmd([[command! RuffFix :!ruff check % --fix]])

function Format()
    vim.cmd("silent! RuffFormat")
    vim.cmd("e")
    vim.cmd("silent! RuffFix")
    vim.cmd("e")
    vim.api.nvim_feedkeys('zz', 'n', true)
end

vim.cmd([[command! Format :lua Format()<CR>]])
vim.api.nvim_set_keymap('n', '<leader>ml', [[:lua Format()<CR>]], { noremap = true, silent = true })

--[[
local group_ruff_format = vim.api.nvim_create_augroup("Ruff", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.py",
	command = "lua RuffPostSave()",
	group = group_ruff_format,
})
]]--

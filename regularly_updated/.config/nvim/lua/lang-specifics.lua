-- Ruff
vim.cmd([[command! RuffFormat :!ruff format %]])
vim.cmd([[command! RuffFix :!ruff check % --fix]])

function RuffPostSave()
    vim.cmd("silent! RuffFormat")
    vim.cmd("e")
    vim.cmd("silent! RuffFix")
    vim.cmd("e")
end

local group_ruff_format = vim.api.nvim_create_augroup("Ruff", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.py",
	command = "lua RuffPostSave()",
	group = group_ruff_format,
})


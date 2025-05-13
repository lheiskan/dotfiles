-- local group = vim.api.nvim_create_augroup("epwalsh_core", { clear = true })

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   group = group,
--   pattern = "*",
--   callback = function()
--     vim.cmd "Gitsigns refresh"
--   end,
-- })

-- go
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = format_sync_grp,
})

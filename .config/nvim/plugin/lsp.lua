vim.lsp.enable({ "gopls", "copilot", "lua_ls" })

-- Snippet navigation
vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if vim.snippet.active({ direction = 1 }) then
		return vim.snippet.jump(1)
	else
		return "<Tab>"
	end
end, { expr = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if vim.snippet.active({ direction = -1 }) then
		return vim.snippet.jump(-1)
	else
		return "<S-Tab>"
	end
end, { expr = true })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.winborder = "rounded"
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>m", ":make<CR>")
vim.keymap.set("n", "gq", "mggg=Gg`g")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d')
vim.keymap.set({ "n", "v", "x" }, "<leader>s", ":e #<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>S", ":sf #<CR>")

vim.keymap.set("n", "<leader>1", function()
	local file = vim.fn.stdpath("config") .. "/init.lua"
	vim.cmd.edit(file)
end, {
	desc = "Edit init.lua",
})
vim.keymap.set("n", "<leader>!", function()
	MiniPick.builtin.files(nil, { source = { cwd = vim.fn.stdpath("config") } })
end, { desc = "Find and pick from nvim configs" })
vim.keymap.set("n", "<leader>2", function()
	local file = vim.fn.expand("~/github/notes/notes/daily/" .. os.date("%Y-%m-%d") .. ".md")
	vim.cmd.edit(file)
end, { desc = "Open today's note" })
vim.keymap.set("n", "<leader>@", function()
	MiniPick.builtin.files(nil, { source = { cwd = vim.fn.expand("~/github/notes") } })
end, { desc = "Find and pick from notes" })

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets.git" },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "svelte", "typescript", "html", "javascript" },
	highlight = true,
	modules = {},
	sync_install = false,
	ignore_install = {},
	auto_install = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

vim.keymap.set("n", "<leader>e", ":Ex<CR>")

vim.cmd("colorscheme vague")
require("mini.pick").setup()
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")

vim.lsp.enable({ "lua_ls", "tinymist" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ld", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

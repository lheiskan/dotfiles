-- NOTE: don't try to use which-key for single-key mappings.
local wk = require("which-key")

-- Pull up my personal tips help doc.
vim.keymap.set("n", "<Leader>hh", ":help personal-tips<cr>")

-- More sensible jump mappings.
vim.keymap.set("v", "L", "$h")
vim.keymap.set("v", "$", "$h")
vim.keymap.set("n", "L", "$")

-- Scroll with mouse one line at a time.
vim.keymap.set("n", "<ScrollWheelUp>", "<C-y>")
vim.keymap.set("n", "<ScrollWheelDown>", "<C-e>")

-- Hop up and down without losing track of where you are.
vim.keymap.set("n", "<C-U>", "10<C-y>")
vim.keymap.set("n", "<C-D>", "10<C-e>")

-- Escape insert/visual mode with 'jk'.
vim.keymap.set("i", "jk", "<esc>l")
vim.keymap.set("v", "<Leader>jk", "<esc>")

-- Move lines up/down.
vim.keymap.set("n", "∆", ":m .+1<cr>==")
vim.keymap.set("n", "˚", ":m .-2<cr>==")
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv")

-- Use ';' for ':'.
vim.keymap.set({ "n", "v" }, ";", ":")

-- Switch to previously edited buffer.
vim.keymap.set("n", "<C-h>", ":b#<cr>")
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
--
-- Shortcut for AsyncRun
vim.keymap.set("n", "!", ":AsyncRun ")

-- Ignore line wrapping when navigating.
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")
-- vim.keymap.set({ "n", "v" }, "0", "g0")
-- vim.keymap.set({ "n", "v" }, "$", "g$")

-- Open visually-selected links in browser.
vim.keymap.set({ "v" }, "gx", function()
	local log = require("core.log")
	local util = require("core.util")

	local maybe_url = util.get_visual_selection()
	if string.sub(maybe_url, 1, 4) == "http" then
		vim.fn.jobstart({ "open", maybe_url })
	else
		log.error("'%s' does not look like a URL", maybe_url)
	end
end)

-- Exit terminal mode like you'd expect.
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l", { silent = true })
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j", { silent = true })
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k", { silent = true })
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { silent = true })

-- Toggle buffer options.
wk.add({
	{ "<Leader>b", group = "Buffer options" },
	{ "<Leader>bf", "<cmd>set foldenable!<cr>", desc = "Toggle folding" },
	{
		"<Leader>bg",
		function()
			require("gitsigns").refresh()
		end,
		desc = "Refresh gitsigns",
	},
	{ "<Leader>bh", "<cmd>noh<cr>", desc = "Turn of highlighting for search" },
	{
		"<Leader>bp",
		function()
			require("core.util").toggle_autopairs()
		end,
		desc = "Toggle autopairs",
	},
	{ "<Leader>bw", "<cmd>set wrap!<cr>", desc = "Toggle wrap" },
	{
		"<Leader>bd",
		function()
			local bufname = vim.api.nvim_buf_get_name(0)
			local dirname = vim.fs.dirname(bufname)
			vim.cmd(string.format("e %s", dirname))
		end,
		desc = "Open buffer's directory",
	},
})

-- OS command shortcuts.
wk.add({
	{
		{ "<Leader>z", group = "OS commands" },
		{ "<Leader>zc", "<cmd>OScp<cr>", desc = "Copy the current file" },
	},
})

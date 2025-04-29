-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })

-- map th, tl to :bnext, :bprev
vim.api.nvim_set_keymap("c", "tk", ":bnext", { noremap = false })
vim.api.nvim_set_keymap("c", "th", ":bprev", { noremap = false })

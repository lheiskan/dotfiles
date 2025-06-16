-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- -- use `vim.keymap.set` instead (from above keymaps.lua)
local map = vim.keymap.set

-- find stuff under dotfiles
-- todo: seems that only searches directory names not file names? wtf
map("n", "<leader>fC", function()
  Snacks.picker.files({
    -- dirs = { "~/.config" },
    cwd = "~/.config",
  })
end, { desc = "Search dotfiles" })

-- does not work for some reason
-- map("n", "<leader>fC", function()
--   LazyVim.pick("files", {
--     -- dirs = { "~/.config" },
--     cwd = "/Users/lauri/.config",
--   })
-- end, { desc = "Search dotfiles" })

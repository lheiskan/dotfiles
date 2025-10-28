require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
}

local function is_treesitter_active(bufnr)
  if vim.treesitter.highlighter.active[bufnr] then
    return true
  end
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  return ok and parser ~= nil
end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    if is_treesitter_active(args.buf) then
      vim.api.nvim_buf_set_option(args.buf, "foldmethod", "expr")
      vim.api.nvim_buf_set_option(args.buf, "foldexpr", "v:lua.vim.treesitter.foldexpr()")
      vim.api.nvim_buf_set_option(args.buf, "foldlevel", 99)
      -- print("✅ Treesitter folding enabled")
      -- else
      --   print("❌ Treesitter inactive for this buffer")
    end
  end,
})


vim.api.nvim_create_autocmd("User", {
  pattern = "TSAttach",
  callback = function(args)
    print("hello")
    local bufnr = args.buf
    local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
    print("Treesitter attached to buffer " .. bufnr .. " with lang: " .. lang)

    -- Set folding options *locally* for this buffer
    vim.api.nvim_buf_set_option(bufnr, "foldmethod", "expr")
    vim.api.nvim_buf_set_option(bufnr, "foldexpr", "v:lua.vim.treesitter.foldexpr()")
  end,
})


vim.lsp.config["gopls"] = {
      cmd = { "gopls" },
      root_markers= { "go.work", "go.mod", "go.sum", ".git" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      settings = {},
      on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- Go to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    -- Optional extras:
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
}


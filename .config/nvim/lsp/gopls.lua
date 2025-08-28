vim.lsp.config["gopls"] = {
      cmd = { "gopls" },
      root_markers= { "go.work", "go.mod", "go.sum", ".git" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" }
      settings = {},
}


vim.lsp.config["pyrefly"] = {
  cmd = { "pyrefly", "lsp" },
  filetypes = { "python" },
  root_markers = { "pyrefly.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
  settings = {},
  on_exit = function(code, _, _)
    vim.notify("Closing Pyrefly LSP exited with code: " .. code, vim.log.levels.INFO)
  end,
  on_attach = function(client, bufnr)
    local output = vim.fn.systemlist("pyrefly dump-config")
    print(table.concat(output, "\n"))
  end,
}

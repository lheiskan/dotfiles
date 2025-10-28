local language_id_mapping = {
  bib = "bibtex",
  pandoc = "markdown",
  plaintex = "tex",
  rnoweb = "rsweave",
  rst = "restructuredtext",
  tex = "latex",
  text = "plaintext",
}

local function loadConfigsAndNotify(client)

  -- todo?
  vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

  -- load local dictionary
  local words = {}
  for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
    table.insert(words, word)
  end
 
  client.config.settings.ltex.dictionary = {
    ["en-US"] = words
  }
  client.notify("workspace/didChangeConfiguration", {
    settings = client.config.settings,
  })
  print("[LTeX] didChangeConfiguration sent")
end

vim.lsp.config["ltex_plus"] = {
  cmd = { "ltex-ls-plus" },
  root_markers = { ".git" },
  filetypes = {
    "bib",
    "context",
    "gitcommit",
    "html",
    "markdown",
    "org",
    "pandoc",
    "plaintex",
    "quarto",
    "mail",
    "mdx",
    "rmd",
    "rnoweb",
    "rst",
    "tex",
    "text",
    "typst",
    "xhtml",
  },
  settings = {
    ltex = {
      enabled = {
        "bib",
        "context",
        "gitcommit",
        "html",
        "markdown",
        "org",
        "pandoc",
        "plaintex",
        "quarto",
        "mail",
        "mdx",
        "rmd",
        "rnoweb",
        "rst",
        "tex",
        "latex",
        "text",
        "typst",
        "xhtml",
      },
      dictionary = {
        ["en-US"] = words
      },
    },
  },
  get_language_id = function(_, filetype)
    return language_id_mapping[filetype] or filetype
  end,
  before_init = function(params, config)
    -- print("[LSP] before_init called!")
    -- vim.notify(vim.inspect({
    --   phase = "before_init",
    --   params = params,
    --   root_dir = config.root_dir,
    -- }))
  end,
  on_init= function(client, init_result)
    -- load local configs and notify server
    loadConfigsAndNotify(client)
  end,
  on_attach = function(client, bufnr)
    -- zg adds a word to the dict. if this happens, also notify the lsp server
    vim.keymap.set("n", "zg", function()
      -- 1. Add the word to the local spell file
      vim.cmd("normal! zg")

      -- 2, reload and notify the server
      loadConfigsAndNotify(client)
    end, { buffer = bufnr, noremap = true, silent = true })

  end,
}

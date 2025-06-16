return {
  "ray-x/go.nvim",
  enabled = true,
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- lsp_keymaps = false,
    -- other options
  },
  config = function(lp, opts)
    require("go").setup(opts)
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        -- TODO: seems like there is some duplicate formatting taking place, messing things up --> disable here for now
        -- require("go.format").goimports()
      end,
      group = format_sync_grp,
    })
  end,
  keys = {
    { "<leader>cb", "<cmd>GoBuild<CR>", desc = "GoBuild", ft = "go" },
    { "<leader>t", group = "Test", desc = "Test" },
    { "<leader>tt", "<cmd>GoTest<cr>", desc = "GoTest", ft = "go" },
    { "<leader>tf", "<cmd>GoTestFunc<cr>", desc = "GoTestFunc", ft = "go" },
  },
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}

return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                go = { "gofmt", "goimports", "injected" },
                xml = { "xmllint" },
            },
            formatters = {
                injected = {
                    options = {
                        -- Set to true to ignore errors
                        ignore_errors = false,
                    }
                },
            },
        })
    end
}


-- require('mini.snippets').setup()
-- local miniCapabilities = require('mini.completion').get_lsp_capabilities()
require('snippy').setup({
  mappings = {
    is = {
      ['<Tab>'] = 'expand_or_advance',
      ['<S-Tab>'] = 'previous',
    },
    nx = {
      ['<leader>se'] = 'expand',
    },
  },
})

vim.snippet.expand = function(snippet_body)
  require('snippy').expand_snippet(snippet_body)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	root_markers= { "go.work", "go.mod", "go.sum", ".git" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	capabilities = capabilities,
	settings = {
		gopls = {
			usePlaceholders = true,
			completeUnimported= true,
			staticcheck= true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	on_attach = function(client, bufnr)
		local opts = { buffer = bufnr, noremap = true, silent = true }

		-- Go to definition
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

		-- Optional extras:
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	end,
}


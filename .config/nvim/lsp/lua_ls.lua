vim.lsp.config['lua_ls'] = {
	-- Command and arguments to start the server.
	cmd = { 'lua-language-server' },
	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },
	-- Sets the "workspace" to the directory where any of these files is found.
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	-- Specific settings to send to the server. The schema is server-defined.
	-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		}
	},
	on_attach = function(client, bufnr)
		local opts = { buffer = bufnr, noremap = true, silent = true }

		-- Go to definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		-- Optional extras:
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- flicker free async formatting
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gq", "<cmd>lua vim.lsp.buf.format({timeout_ms=500})<CR>",
			{ silent = true })


		-- Enable completion
		vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
	end,
}

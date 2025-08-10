return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { 
					"c", 
					"lua", 
					"vim", 
					"vimdoc", 
					"query", 
					"go", 
					"javascript", 
					"typescript", 
					"java", 
					"rust", 
					"zig", 
					"python", 
					"html", 
					"sql", 
					"json", 
					"xml" 
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			})
		end
	}
}

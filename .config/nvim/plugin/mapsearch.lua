-- Define a custom command :MapSearch [pattern]
-- Useful when searching for mappings, opens all existing mappings
-- in a buffer and allows normal nvim tools to search the list
vim.api.nvim_create_user_command("MapSearch", 
    function(opts) 
        require('commands.mapsearch')(opts)
    end , { nargs = "?" })

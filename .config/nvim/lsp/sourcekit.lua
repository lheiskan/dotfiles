vim.lsp.config["sourcekit"] = {
    cmd = { "sourcekit-lsp" },
    capabilities = {
        textDocument = {
            diagnostic = {
                dynamicRegistration = true,
                relatedDocumentSupport = true
            }
        },
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true
            }
        }
    },
    root_markers = { ".xcodeproj", ".xcworkspace", "Package.swift", ".git" },
    filetypes = { "swift", "objc", "objcpp", "c", "cpp" },
    get_language_id = function(bufnr, filetype) 
        local t = { objc = 'objective-c', objcpp = 'objective-cpp' }
        return t[ftype] or ftype
    end,
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- Disable CodeLens for Swift files (not supported by sourcekit atm)
        if vim.bo[bufnr].filetype == "swift" then
          client.server_capabilities.codeLensProvider = nil
        end

        -- Go to definition
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

        -- Optional extras:
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
}


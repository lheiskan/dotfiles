local embedded_xml_query = vim.treesitter.query.parse(
    "go",
    [[
    (
        (raw_string_literal_content) @xml
        (#match? @xml "\\s*\\<\\?xml")
        )
]])

local get_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "go", {})
    local tree = parser:parse()[1]
    return tree:root()
end

format_dat_xml = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].filetype ~= "go" then
        vim.notify "can only be used in go"
        return
    end

    local root = get_root(bufnr)
    local changes = {}

    for id, node in embedded_xml_query:iter_captures(root, bufnr, 0, -1) do
        local name = embedded_xml_query.captures[id]
        if name == "xml" then
            local range = { node:range() }
            local indentation = string.rep(" ", range[2])

            local formatted = vim.fn.systemlist("xmllint --format -", xml_string)
            for idx, line in ipairs(formatted) do
                if idx > 1 then
                    formatted[idx] = indentation .. line
                end
            end
            table.insert(changes, 1,
                {
                    start_row = range[1],
                    start_col = range[2],
                    end_row = range[3],
                    end_col = range[4],
                    formatted = formatted,
                })
        end
    end

    for _, change in ipairs(changes) do
        vim.api.nvim_buf_set_text(bufnr, change.start_row, change.start_col, change.end_row, change.end_col,
            change.formatted)
    end
end

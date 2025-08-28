local patterns = vim.api.nvim_get_runtime_file("ftplugin/*.vim", true)
local filetypes = vim.tbl_map(function(p)
  return vim.fn.fnamemodify(p, ":t:r")
end, patterns)

table.sort(filetypes)

local go_types = {}
for _, ft in ipairs(filetypes) do
  if ft:sub(1, 2) == "go" then
    table.insert(go_types, ft)
  end
end

print(vim.inspect(go_types))

-- function to export all defined mappings into a buffer
-- allows investigating mappings with nvim tools (search etc...)
local function mapsearch(opts)
  local pattern = opts.args ~= "" and opts.args or nil
  local modes = { "n", "i", "v", "x", "s", "o", "c", "t" }
  local matches = {}

  for _, mode in ipairs(modes) do
    for _, m in ipairs(vim.api.nvim_get_keymap(mode)) do
      local text = (m.desc or "") .. " " .. (m.rhs or "")
      if not pattern or text:match(pattern) then
        local line = string.format("[%s] %-10s -> %s",
          mode, m.lhs, m.desc or m.rhs or "")
        table.insert(matches, line)
      end
    end
  end

  if #matches == 0 then
    vim.notify("No matches found" .. (pattern and (" for: " .. pattern) or ""), vim.log.levels.INFO)
    return
  end

  -- Open results in a scratch buffer
  vim.cmd("new")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.api.nvim_buf_set_lines(0, 0, -1, false, matches)
end

return mapsearch

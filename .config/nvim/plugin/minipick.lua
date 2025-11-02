local pick = require('mini.pick')

-- Helper to show mappings
function _G.SearchKeymaps()
  local modes = { 'n', 'i', 'v', 'x', 'o' }
  local all_maps = {}
  for _, mode in ipairs(modes) do
    local maps = vim.api.nvim_get_keymap(mode)
    for _, m in ipairs(maps) do
      table.insert(all_maps, {
        mode = mode,
        lhs = m.lhs,
        rhs = m.rhs or '',
        desc = m.desc or '',
        sid = m.sid or '',
      })
    end
  end

  pick.start({
    source = {
      items = vim.tbl_map(function(m)
        return string.format("%-2s %-15s %-30s %s", m.mode, m.lhs, m.rhs, m.desc)
      end, all_maps),
      name = 'Keymaps',
    },
  })
end

vim.keymap.set('n', '<leader>km', SearchKeymaps, { desc = 'Search keymaps (Mini.pick)' })


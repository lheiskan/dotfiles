-- File: lua/keylogger.lua
-- A simple Neovim plugin to log keys, commands, and motions

local M = {}
local log_file

-- Start logging to a file (or pipe)
function M.start(path)
  path = path or "/tmp/nvim_keylog"
  log_file = assert(io.open(path, "a"))  -- append mode

  -- Register a key handler
  vim.on_key(function(key, pressed)
    if not log_file then return end

    -- Translate keys into readable form (e.g. <CR>, <Esc>)
    local key_str = vim.fn.keytrans(key)
    local pressed_str = vim.fn.keytrans(pressed)

    -- Get context
    local mode = vim.fn.mode()   -- current mode: n/i/v/…
    local time = os.date("%Y-%m-%d %H:%M:%S")

    -- Write log entry
    log_file:write(string.format("[%s] (%s) %-15 %-15\n", time, mode, pressed_str, key_str))
    log_file:flush()
  end, vim.api.nvim_create_namespace("keylogger"))
end

-- Stop logging
function M.stop()
  if log_file then
    log_file:close()
    log_file = nil
  end
end

return M



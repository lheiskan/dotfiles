local M = {}

local job_id=5

-- lua print vim.b.terminal_job_id
-- or
-- =vim.b.terminal_job_id
-- --> in termnal, they print the job id of the terminal buffer
local function get_visual_selection()
  local s=vim.fn.getpos("'<")
  local e=vim.fn.getpos("'>")

  local lines = vim.api.nvim_buf_get_lines(0, s[2]-1, e[2], false)
  return table.concat(lines, "\n") .. "\n"
end

local function eval()
  local s = get_visual_selection()
  --vim.notify(s)
  vim.api.nvim_chan_send(job_id, s)
end

local function init()
  job_id=vim.b.terminal_job_id
  if job_id then 
    print("job id is set to " .. job_id)
  else
    print("info: not initialized, call init from a nvim terminal where sicp repl will be running")
  end

end

local function info()
  if job_id then
    vim.notify("job_id:" .. job_id)
  else
    print("info: not initialized")
  end

end


M.eval = eval
M.init = init
M.info = info

return M

-- Custom command to set MiniDiff's source dynamically
vim.api.nvim_create_user_command('DiffAgainst', function(opts)

  local buf_id = vim.api.nvim_get_current_buf()
  local branch = opts.args
  local file_path = vim.api.nvim_buf_get_name(buf_id)
  -- Get Git root
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  -- Compute relative path
  local rel_path = vim.fn.fnamemodify(file_path, ":." .. git_root)

  print("Current buffer ID is:", buf_id)
  print("Branch is :", branch)
  print("[DiffDebug] buf_id:", buf_id, "file_path:", file_path)
  print("[DiffDebug] git_root:", git_root)
  print("[DiffDebug] rel_path:", rel_path)

  if rel_path == '' then
    print("[DiffDebug] buffer has no name, skipping")
    return
  end

  local output = vim.fn.systemlist({'git', 'show', branch .. ':' .. rel_path})
  print("[DiffDebug] git show exit code:", vim.v.shell_error)

  if vim.v.shell_error ~= 0 then
    print("[DiffDebug] git show output:", output)
    return
  end

  print("[DiffDebug] successfully got file from branch")
  MiniDiff.set_ref_text(buf_id, output)
  print("[DiffDebug] set ref text complete")

  print('MiniDiff now comparing against ' .. branch)

end, { nargs = 1, complete = 'shellcmd' })


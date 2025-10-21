local M = {}

M.cmd_exec = function(command)
  return function()
    vim.cmd(command)
  end
end

M.cmd_str = function(command)
  return "<CMD>" .. command .. "<CR>"
end

M.map = vim.keymap.set

return M

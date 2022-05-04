local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

leap.set_default_keymaps()
function leap_bidirectional()
  leap.leap {
    ['target-windows'] = { vim.fn.getwininfo(vim.fn.win_getid())[1] },
  }
end
keymap("n", "<leader>j", ('<Plug>(leap-backward)'), opts)
vim.cmd('unmap S');
keymap("n", "<leader>l", ('<Plug>(leap-forward)'), opts)
vim.cmd('unmap s');

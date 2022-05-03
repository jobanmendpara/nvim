local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

leap.set_default_keymaps()
function leap_bidirectional()
  leap.leap {
    ['target-windows'] = { vim.fn.getwininfo(vim.fn.win_getid())[1] }
  }
end

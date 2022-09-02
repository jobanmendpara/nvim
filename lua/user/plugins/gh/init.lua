local status_ok, gh = require("gh.nvim")
if not status_ok then
  return
end

gh.setup({
  keymaps = {
    open = '<cr>',
    expand = 'zo',
    collapse = 'zc',
  }
})

local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

local icons = require("user.icons")

notify.setup({
  stages = "fade_in_slide_out",
  op_open = nil,
  on_close = nil,
  render = "default",
  timeout = 175,
  background_color = "Normal",
  minimum_width = 10,
  icons = {
    ERROR = icons.diagnostics.Error,
    WARN = icons.diagnostics.Warning,
    INFO = icons.diagnostics.Information,
    BUG = icons.ui.Bug,
    TRACE = icons.ui.Trace,
  }
})

vim.notify = notify

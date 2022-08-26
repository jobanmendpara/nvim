local status_ok, auto_dark_mode = pcall(require, 'auto-dark-mode')
if not status_ok then
  return
end

auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    print('dark')
    vim.wait(20)
    vim.cmd('Catppuccin mocha')
  end,
  set_light_mode = function()
    print('light')
    vim.wait(20)
    vim.cmd('Catppuccin latte')
  end,
})
auto_dark_mode.init()

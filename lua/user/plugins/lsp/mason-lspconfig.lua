local status_ok, config = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end

config.setup()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require('user.plugins.lsp.handlers')
local settings = require('user.plugins.lsp.settings')

local navic = require('nvim-navic')
local function on_attach (client, bufnr)
  navic.attach(client, bufnr)
end

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = handlers.capabilities,
  settings = settings.sumneko_lua,
})
lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = handlers.capabilities
})
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = handlers.capabilities
})
lspconfig.volar.setup({
  on_attach = on_attach,
  capabilities = handlers.capabilities
})

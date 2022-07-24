local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local handlers = require('user.plugins.lsp.handlers')
local settings = require('user.plugins.lsp.settings')

lspconfig.sumneko_lua.setup({
  capabilities = handlers.capabilities,
  settings = settings.sumneko_lua,
})
lspconfig.tsserver.setup({ capabilities = handlers.capabilities })
lspconfig.eslint.setup({ capabilities = handlers.capabilities })
lspconfig.vls.setup({ capabilities = handlers.capabilities })
lspconfig.volar.setup({ capabilities = handlers.capabilities })

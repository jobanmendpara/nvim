local M = {}

M.capabilities =vim.lsp.protocol.make_client_capabilities()

M.setup = function()
  local icons = require('user.misc.icons')
  local signs = {
    {
      name = 'DiagnosticSignError', text = icons.error_lg,
    },
    {
      name = 'DiagnosticSignWarn', text = icons.warn_lg,
    },
    {
      name = 'DiagnosticSignHint', text = icons.hint_lg,
    },
    {
      name = 'DiagnosticSignInfo', text = icons.information_lg,
    },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ''})
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

return M

local keymap = vim.keymap.set
local j = ''
keymap('n', '<leader>gl', function()
  vim.diagnostic.open_float({'line'})
end)

keymap('n', '<leader>[d', function()
  vim.diagnostic.goto_prev()
end)

keymap('n', '<leader>]d', function()
  vim.diagnostic.goto_next()
end)

keymap('n', '<leader>gd', function()
  vim.lsp.buf.definition()
end)

keymap('n', '<leader>gD', function()
  vim.lsp.buf.declaration()
end)

keymap('n', '<leader>gi', function()
  vim.lsp.buf.implementation()
end)

keymap('n', '<leader>gw', function()
  vim.lsp.buf.document_symbol()
end)

keymap('n', '<leader>gW', function()
  vim.lsp.buf.workspace_symbol()
end)

keymap('n', '<leader>gr', function()
  vim.lsp.buf.references()
end)

keymap('n', '<leader>gt', function()
  vim.lsp.buf.type_definition()
end)

keymap('n', 'K', function()
  vim.lsp.buf.hover()
end)

keymap('n', '<leader><c-k>', function()
  vim.lsp.buf.signature_help()
end)

keymap('n', '<leader>ca', function()
  vim.lsp.buf.code_action()
end)
keymap('n', '<leader>rn', function()
  vim.lsp.buf.rename()
end)

local k = ''

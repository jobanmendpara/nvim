local keymap = vim.keymap.set

keymap('n', 'K', function()
  vim.lsp.buf.hover()
end)

local status_ok, lsp = pcall(require, 'lsp-zero');

lsp.preset('recommended')
lsp.setup()

require('user.plugins.lsp.mason')
require('user.plugins.lsp.mason-lspconfig')
require('user.plugins.lsp.null-ls')

local keymap = vim.keymap.set

keymap('n', '<leader>e', ':NvimTreeToggle<cr>')
keymap('n', '<leader>er', ':NvimTreeRefresh<cr>')
keymap('n', '<leader>ef', ':NvimTreeFocus<cr>')
keymap('n', '<leader>ek', ':NvimTreeCollapseKeepBuffers<cr>')

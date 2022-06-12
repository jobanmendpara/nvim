local map = require('user.utils').map

map('n', '<leader>e', ':NvimTreeToggle<cr>')
map('n', '<leader>er', ':NvimTreeRefresh<cr>')
map('n', '<leader>ef', ':NvimTreeFocus<cr>')
map('n', '<leader>ek', ':NvimTreeCollapseKeepBuffers<cr>')
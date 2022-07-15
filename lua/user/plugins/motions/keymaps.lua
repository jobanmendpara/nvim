local keymap = vim.keymap.set

keymap('n', '<leader>jw', '<cmd>HopWord<cr>')
keymap('n', '<leader>jl', '<cmd>HopLine<cr>')
keymap('n', '<leader>l', '<cmd>HopChar1<cr>')
keymap('n', '<leader>L', '<cmd>HopChar2<cr>')

keymap('v', '<leader>jw', '<cmd>HopWord<cr>')
keymap('v', '<leader>jl', '<cmd>HopLine<cr>')
keymap('v', '<leader>l', '<cmd>HopChar1<cr>')
keymap('v', '<leader>L', '<cmd>HopChar2<cr>')

local term_opts = {
    silent = true
}

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap('n', '<Space>', '<Nop>')
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Normal
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>')
keymap('n', '<C-Down>', ':resize +2<CR>')
keymap('n', '<C-Left>', ':vertical resize -2<CR>')
keymap('n', '<C-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>')
keymap('n', '<S-h>', ':bprevious<CR>')

-- Move text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<CR>==gi')
keymap('n', '<A-k>', '<Esc>:m .-2<CR>==gi')

-- Insert
-- Press jk fast to escape
keymap('i', 'jk', '<Esc>')

-- Visual
-- Stay in indent mode
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR==')
keymap('v', '<A-k>', ':m .-2<CR==')
keymap('v', 'p', '"_dP')

-- Visual Block
-- Move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv")
keymap('x', 'K', ":move '<-2<CR>gv-gv")
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv")
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- Terminal
-- Better terminal navigation
-- keymap("t", "<C-h">, "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j">, "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-l">, "<C-\\><C-N><C-w>l", term_opts)
-- keymap("t", "<C-k">, "<C-\\><C-N><C-w>k", term_opts)

-- My Actions
-- Toggle background light/dark mode
keymap('n', '<leader>cb', function()
    if (vim.o.background == 'dark') then
        print('Light Mode')
        vim.o.background = 'light'
    else
        print('Dark Mode')
        vim.o.background = 'dark'
    end
end)

-- Save Buffer
keymap('n', '<leader>w', '<cmd>w<cr>')
-- Quit Buffer/Window?
keymap('n', '<leader>q', '<cmd>q<cr>')
-- Quit All
keymap('n', '<leader>-', '<cmd>qa<cr>')

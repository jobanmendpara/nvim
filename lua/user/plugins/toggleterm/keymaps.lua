local buf_keymap = vim.api.nvim_buf_set_keymap
local keymap = vim.keymap.set

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true
})
local node = Terminal:new({
    cmd = "node",
    hidden = true
})

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

function _NODE_TOGGLE()
    node:toggle()
end

function _G.set_terminal_keymaps()
    local opts = {
        noremap = true
    }
    buf_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    buf_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    buf_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    buf_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    buf_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    buf_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

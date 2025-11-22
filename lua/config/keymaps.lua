-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("utils").map
local exec = require("utils").cmd_exec

map("n", "<leader><leader>", ":", { desc = "Command" })

map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "<C-r>", "<Nop>")

map({ "n", "v" }, "<leader>Y", exec("%y+"), { desc = "Yank Buffer to System Clipboard" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank Selection to System Clipboard" })

map("x", "p", '"_dP')

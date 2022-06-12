local builtins = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>fb', function()
  builtins.buffers()
end)

vim.keymap.set('n', '<leader>fbi', function()
  builtins.builtins()
end)

vim.keymap.set('n', '<leader>fcs', function()
  builtins.colorscheme()
end)

vim.keymap.set('n', '<leader>fc', function()
  builtins.commands()
end)

vim.keymap.set('n', '<leader>fch', function()
  builtins.command_history()
end)

vim.keymap.set('n', '<leader>fib', function()
  builtins.command_history()
end)

vim.keymap.set('n', '<leader>ff', function()
  builtins.find_files()
end)

vim.keymap.set('n', '<leader>fft', function()
  builtins.filetypes()
end)

vim.keymap.set('n', '<leader>fgf', function()
  builtins.git_files()
end)

vim.keymap.set('n', '<leader>fgc', function()
  builtins.git_commits()
end)

vim.keymap.set('n', '<leader>fgb', function()
  builtins.git_branches()
end)

vim.keymap.set('n', '<leader>fgS', function()
  builtins.git_stash()
end)

vim.keymap.set('n', '<leader>fgs', function()
  builtins.git_status()
end)

vim.keymap.set('n', '<leader>fgs', function()
  builtins.grep_string()
end)

vim.keymap.set('n', '<leader>fht', function()
  builtins.help_tags()
end)

vim.keymap.set('n', '<leader>fkm', function()
  builtins.keymaps()
end)

vim.keymap.set('n', '<leader>flg', function()
  builtins.live_grep()
end)

vim.keymap.set('n', '<leader>fmp', function()
  builtins.man_pages()
end)

vim.keymap.set('n', '<leader>fof', function()
  builtins.oldfiles()
end)

vim.keymap.set('n', '<leader>fp', function()
  builtins.pickers()
end)

vim.keymap.set('n', '<leader>fr', function()
  builtins.registers()
end)

vim.keymap.set('n', '<leader>frl', function()
  builtins.reloader()
end)

vim.keymap.set('n', '<leader>frf', function()
  builtins.resume()
end)

vim.keymap.set('n', '<leader>fsh', function()
  builtins.search_history()
end)

vim.keymap.set('n', '<leader>ft', function()
  builtins.tags()
end)

vim.keymap.set('n', '<leader>fts', function()
  builtins.treesitter()
end)

vim.keymap.set('n', '<leader>fvo', function()
  builtins.vim_options()
end)

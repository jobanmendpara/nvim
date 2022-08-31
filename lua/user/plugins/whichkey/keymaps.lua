local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local builtins = require('telescope.builtin')
local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true -- use `nowait` when creating keymaps
}

local function lspShowCodeActions()
  vim.lsp.buf.code_action()
end

local function lspShowDefinition()
  vim.lsp.buf.definition()
end

local function lspShowTypeDefinition()
  vim.lsp.buf.type_definition()
end

local function lspShowImplementation()
  vim.lsp.buf.implementation()
end

local function lspShowReferences()
  vim.lsp.buf.references()
end

local function lspRename()
  vim.lsp.buf.rename()
end

local mappings = {
  space_mappings = {
    c = {'<cmd>Bdelete!<cr>', 'Close Buffer'},
    e = {'<cmd>NvimTreeToggle<cr>', 'Toggle Explorer'},
    f = {builtins.current_buffer_fuzzy_find, 'Current Buffer Fuzzy Finder'},
    F = {builtins.live_grep, 'Find in Project'},
    p = {'<cmd>TroubleToggle<cr>', 'Toggle Problems'},
    s = {'<cmd>vsplit<cr>', 'Vertical Split'},
    S = {'<cmd>hsplit<cr>', 'Horizontal Split'},
    t = {'<cmd>ToggleTerm<cr>', 'Toggle Terminal'},
    v = {'<cmd>Neogit<cr>', 'Neogit'},
    V = {'<cmd>LazyGit<cr>', 'LazyGit'},
    w = {'<cmd>w<cr>', 'Save Buffer'},
    W = {'<cmd>wa<cr>', 'Save All Buffers'},
    ['['] = {
      name = 'LSP',
      c = {lspShowCodeActions, 'Show Code Actions'},
      d = {lspShowDefinition, 'Show Definition'},
      D = {lspShowTypeDefinition, 'Show Type Definition'},
      i = {lspShowImplementation, 'Show Implementations'},
      n = {lspRename, 'Rename'},
      r = {lspShowReferences, 'Show References'},
    },
    ['/'] = {
      name = 'Hop',
      ['w'] = {'<cmd>HopWord<cr>', 'Hop Word'},
      ['l'] = {'<cmd>HopLine<cr>', 'Hop Line'},
      ['p'] = {'<cmd>HopPattern<cr>', 'Hop Pattern'},
    },
    [','] = {
      name = 'Telescope',
      b = {builtins.buffers, 'Buffers'},
      c = {builtins.colorscheme, 'Colorschemes'},
      f = {builtins.find_files, 'Files'},
      F = {builtins.oldfiles, 'Recent Files'},
      o = {builtins.vim_options, 'Options'},
      r = {builtins.registers, 'Registers'},
      R = {builtins.resume, 'Resume'},
      s = {builtins.search_history, 'Search History'},
      t = {builtins.treesitter, 'Treesitter'},
    },
  },
  popup_mappings = {
      scroll_down = '<C-d>',
      scroll_up = '<C-u>'
  }
}

which_key.register(mappings.space_mappings, opts)

return mappings

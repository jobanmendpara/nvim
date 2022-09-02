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

local mappings = {
  space_mappings = {
    c = {'<cmd>Bdelete!<cr>', 'Close Buffer'},
    e = {'<cmd>NvimTreeToggle<cr>', 'Toggle Explorer'},
    E = {'<cmd>NvimTreeFindFile<cr>', 'Find Current File'},
    f = {builtins.current_buffer_fuzzy_find, 'Current Buffer Fuzzy Finder'},
    F = {builtins.live_grep, 'Find in Project'},
    m = {'<cmd>MindOpenProject<cr>', 'Open Mind - Project'},
    M = {'<cmd>MindOpenMain<cr>', 'Open Mind - Main'},
    o = {'<cmd>SymbolsOutline<cr>', 'SymbolsOutline'},
    p = {'<cmd>TroubleToggle<cr>', 'Toggle Problems'},
    r = {'', 'Refresh'},
    s = {'<cmd>vsplit<cr>', 'Vertical Split'},
    S = {'<cmd>hsplit<cr>', 'Horizontal Split'},
    t = {'<cmd>ToggleTerm<cr>', 'Toggle Terminal - Float'},
    v = {'<cmd>Neogit<cr>', 'Neogit'},
    V = {'<cmd>LazyGit<cr>', 'LazyGit'},
    w = {'<cmd>w<cr>', 'Save Buffer'},
    W = {'<cmd>wa<cr>', 'Save All Buffers'},
    ['['] = {
      name = 'LSP',
      c = {vim.lsp.buf.code_action, 'Show Code Actions'},
      d = {vim.lsp.buf.definition, 'Show Definition'},
      D = {vim.lsp.buf.type_definition, 'Show Type Definition'},
      i = {vim.lsp.buf.implementation, 'Show Implementations'},
      n = {vim.lsp.buf.rename, 'Rename'},
      r = {vim.lsp.buf.references, 'Show References'},
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
      B = {'<cmd>Browse<cr>', 'Browse'},
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

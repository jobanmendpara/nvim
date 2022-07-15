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
    ['f'] = {
      name = 'Find',
      b = {builtins.buffers, 'Buffers'},
      ['f'] = {
        name = 'Files',
        f = {builtins.find_files, 'File File'},
        o = {builtins.oldfiles, 'Old Files'}
      },
      ['g'] = {
        name = 'Git',
        f = {builtins.git_files, 'Git Files'},
        c = {builtins.git_commits, 'Git Commits'},
        b = {builtins.git_branch, 'Git Branch'},
        s = {builtins.git_status, 'Git Status'},
        S = {builtins.git_stash, 'Git Stash'},
      },
      ['l'] = {
        name = 'LSP',
        d = {builtins.lsp_diagnostics, 'Diagnostics'},
        i = {builtins.lsp_implementations, 'Implementations'},
        ['D'] = {
          name = 'Definitions',
          d = {builtins.lsp_type_definitions, 'Definitions'},
          D = {builtins.lsp_type_definitions, 'Type Definitions'}
        },
        r = {builtins.lsp_references, 'References'},
        ['s'] = {
          name = 'Symbols',
          d = {builtins.lsp_document_symbols, 'Document Symbols'},
          w = {builtins.lsp_workspace_symbols, 'Workspace Symbols'},
          W = {builtins.lsp_workspace_symbols, 'Dynamic Workspace Symbols'},
        },
      },
      ['n'] = {
        name = 'Neovim',
        c = {builtins.commands, 'Command'},
        C = {builtins.colorscheme, 'Colorscheme'},
        h = {builtins.command_history, 'Command History'},
        H = {builtins.help_tags, 'Help Tags'},
        k = {builtins.keymaps, 'Keymaps'},
        m = {builtins.map_pages, 'Manual'},
        o = {builtins.vim_options, 'Options'},
      },
      p = {builtins.pickers, 'Pickers'},
      r = {builtins.registers, 'Registers'},
      R = {builtins.resume, 'Resume'},
      ['s'] = {
        name = 'Search',
        i = {builtins.current_buffer_fuzzy_find, 'Current Buffer Fuzzy Finder'},
        s = {builtins.grep_string, 'Grep String'},
        S = {builtins.live_grep, 'Live Grep'},
        h = {builtins.search_history, 'Search History'},
        t = {builtins.tags, 'Tags'},
      },
      t = {builtins.treesitter, 'Treesitter'},
    },
    w = {'<cmd>w<cr>', 'Save Buffer'},
    q = {'<cmd>q<cr>', 'Quit Window'},
  },
  popup_mappings = {
      scroll_down = '<C-d>',
      scroll_up = '<C-u>'
  }
}

which_key.register(mappings.space_mappings, opts)

return mappings

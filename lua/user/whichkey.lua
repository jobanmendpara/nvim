local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestings
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling, and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  key_labels = {
    --override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    seperator = "➜", -- symbold used between a key and it's label
    group = "+", -- symbol prepend to group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin
    padding = { 2, 2, 2, 2 }, -- extra window padding
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center, or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WK
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local spaceMappings = {
  ["1"] = { "<cmd>Alpha<cr>", "Dashboard" },
  ["-"] = { "<cmd>qa!<cr>", "Exit Neovim" },
  f = {
    name = "Files",
    ["s"] = { "<cmd>w!<cr>", "Save" },
    ["S"] = { "<cmd>wa!<cr>", "Save All" },
    ["c"] = { "<cmd>Bdelete!<cr>", "Close Buffer"},
    ["h"] = { "<cmd>noh<cr>", "No Highlight" },
  },
  p = {
    name = "Project",
    ["t"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
    ["f"] = { "<cmd>NvimTreeFocus<cr>", "Focus Explorer" },
    ["F"] = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find Files" },
    ["T"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  },
  w = {
    name = "Window",
    ["q"] = { "<cmd>q<cr>", "Quit" },
    ["h"] = { "<cmd>split<cr>", "HSplit" },
    ["v"] = { "<cmd>vsplit<cr>", "VSplit" },
  },
  m = {
    name = "Motion",
    w = { "<cmd>HopWord<cr>", "HopWord" },
    l = { "<cmd>HopLine<cr>", "HopLine" },
    c = { "<cmd>HopChar1<cr>", "HopChar1" },
    C = { "<cmd>HopChar2<cr>", "HopChar2" },
    p = { "<cmd>HopPattern<cr>", "HopPattern" },
  },
  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  l = {
    name = "LSP",
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  },
  G = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
    e = { "<cmd>Telescope git_status<cr>", "Status" },
    c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    n = { "<cmd>Neogit<cr>", "Neogit" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Manual Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
  },
  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
}

which_key.setup(setup)
which_key.register(spaceMappings, opts)

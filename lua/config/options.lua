-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.clipboard = ""
vim.opt.cmdheight = 0
vim.opt.colorcolumn = "80"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = false
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "/",
    eob = " ",
}
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
-- vim.o.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.guifont = "Geist Mono"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3

vim.opt.expandtab = true
vim.opt.listchars = {
    tab = ' ',
    eol = ' ', --'↲',
    trail = '-',
    extends = ' ',
    precedes = ' ',
    space = ' '
}
vim.opt.list = true

vim.opt.mousemoveevent = true
vim.opt.mousescroll = "ver:3,hor:6"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,terminal,globals"
vim.opt.shiftwidth = 2
vim.opt.showmode = true
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes:2"
vim.opt.numberwidth = 3
vim.opt.spelloptions = "camel,noplainbuffer"
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.syntax = "on"
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wrap = false
vim.opt.writebackup = false

-- command completion
vim.opt.wildmode = "longest:full:full"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*DS_STORE,*.db"

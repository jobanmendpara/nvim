local options = {
  background ='dark',
	backup = false, -- creates backup file
	clipboard = "unnamedplus", -- allows nvim to access the system clipboard
	cmdheight = 1, -- more space in the nvim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	cursorline = true, -- highlight the current line
	expandtab = true, -- convert tabs to spaces
	fileencoding = "utf-8", -- the encoding written to a file
	guifont = "UbuntuMono Nerd Font Mono:h18",
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	laststatus = 3, -- sets global status
	mouse = "a", -- allow the mouse to be used in nvim
	number = true, -- set numbered lines
	numberwidth = 2, -- set number column width to 2 (default 4)
	pumheight = 10, -- popup menu height
	relativenumber = false, -- set relative numbered lines
	scrolloff = 5,
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	showmode = false, -- hides current mode in status line
	showtabline = 2, -- always show tabs
  sidescrolloff = 8,
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal split to go below the current window
	splitright = true, -- force all vertical splits to go the the right of the current window
	swapfile = false, -- creates a swapfile
	tabstop = 2, -- insert 2 spaces for a tab
	termguicolors = true, -- set terminal gui color (most terminals support this)
	timeoutlen = 250, -- time to wait for a mapped sequence to complete (in ms)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	wrap = false, -- display lines as one long line
	writebackup = false, -- if a file is being edited by another program (or was written to a file editing with another program, it is now allowed to be edited)
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work <- copied from chris@machine

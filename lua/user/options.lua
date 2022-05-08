local options = {
	laststatus = 3, -- sets global status
	backup = false, -- creates backup file
	clipboard = "unnamedplus", -- allows nvim to access the system clipboard
	cmdheight = 1, -- more space in the nvim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in nvim
	pumheight = 10, -- popup menu height
	showmode = false, -- hides current mode in status line
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = false, -- make indenting smarter again
	splitbelow = true, -- force all horizontal split to go below the current window
	splitright = true, -- force all vertical splits to go the the right of the current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set terminal gui color (most terminals support this)
	guifont = "JetBrainsMono Nerd Font Mono:h16",
	timeoutlen = 100, -- time to wait for a mapped sequence to complete (in ms)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to a file editing with another program, it is now allowed to be edited)
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 (default 4)
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- copied from chis@machine
	sidescrolloff = 8, -- copied from chis@machine
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work <- copied from chris@machine

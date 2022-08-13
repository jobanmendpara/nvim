vim.cmd [[
try
	colorscheme catppuccin
	catch /^Vim\%((\a\+)\)\ =:E185/
		colorscheme rose-pine
	endtry
]]

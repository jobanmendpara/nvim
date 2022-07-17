vim.cmd [[
try
	colorscheme rose-pine
	catch /^Vim\%((\a\+)\)\ =:E185/
		colorscheme tokyonight
	endtry
]]

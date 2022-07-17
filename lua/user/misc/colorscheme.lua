vim.cmd [[
try
	colorscheme snazzy
	catch /^Vim\%((\a\+)\)\ =:E185/
		colorscheme tokyonight
	endtry
]]

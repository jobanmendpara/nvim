vim.cmd [[
try
	colorscheme everforest
	catch /^Vim\%((\a\+)\)\ =:E185/
		colorscheme tokyonight
		set background = dark
	endtry
]]

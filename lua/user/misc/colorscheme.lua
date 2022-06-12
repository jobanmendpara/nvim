vim.cmd [[
try
  set background=dark
	colorscheme snazzy
	catch /^Vim\%((\a\+)\)\ =:E185/
		colorscheme tokyonight
	endtry
]]

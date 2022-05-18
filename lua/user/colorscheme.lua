vim.cmd [[
try
  set background=light
	colorscheme sonokai
	catch /^Vim\%((\a\+)\)\ =:E185/
		colorscheme tokyonight
	endtry
]]

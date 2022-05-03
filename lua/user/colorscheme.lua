vim.cmd [[
try
  let g:sonokai_style = 'andromeda'
  let g:sonokai_better_performance = 1
	colorscheme sonokai
	catch /^Vim\%((\a\+)\)\ =:E185/
		colorscheme tokyonight
		set background = dark
	endtry
]]

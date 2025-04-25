local cmd = require("utils").cmd

local M = {
	'nvimdev/lspsaga.nvim',
	event = 'VeryLazy',
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
		ui = {
			code_action = ''
		}
	},
	keys = {
		{
			"<F4>",
			cmd("Lspsaga code_action"),
			desc = "References",
		},
		{
			"<F10>",
			cmd("Lspsaga finder"),
			desc = "References",
		},
		{
			"<F12>",
			cmd("Lspsaga goto_definition"),
			desc = "Go to Definition",
		},
		{
			"<S-k>",
			cmd("Lspsaga hover_doc"),
			desc = "Peek",
		},
	},
}

return M

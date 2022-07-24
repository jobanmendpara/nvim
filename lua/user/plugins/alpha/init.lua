local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	-- [[                               __                ]],
	-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

	-- [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
	-- [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
	-- [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
	-- [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	-- [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	-- [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],

   [[███╗   ███╗ ███████╗ ██╗      ██╗       ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
   [[████╗ ████║ ██╔════╝ ██║      ██║      ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
   [[██╔████╔██║ █████╗   ██║      ██║      ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
   [[██║╚██╔╝██║ ██╔══╝   ██║      ██║      ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
   [[██║ ╚═╝ ██║ ███████╗ ███████╗ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
   [[╚═╝     ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],

  -- [[      |\      _,,,---,,_             ]],
  -- [[ZZZzz /,`.-'`'    -.  ;-;;,_         ]],
  -- [[     |,4-  ) )-,_. ,\ (  `'-'        ]],
  -- [[    '---''(_/--'  `-'\_)  Felix Lee  ]],

  -- [[                              _                   ]],
  -- [[                            .' `'.__              ]],
  -- [[                           /      \ `'"-,         ]],
  -- [[          .-''''--...__..-/ .     |      \        ]],
  -- [[        .'               ; :'     '.  a   |       ]],
  -- [[       /                 | :.       \     =\      ]],
  -- [[      ;                   \':.      /  ,-.__;.-;` ]],
  -- [[     /|     .              '--._   /-.7`._..-;`   ]],
  -- [[    ; |       '                |`-'      \  =|    ]],
  -- [[    |/\        .   -' /     /  ;         |  =/    ]],
  -- [[    (( ;.       ,_  .:|     | /     /\   | =|     ]],
  -- [[     ) / `\     | `""`;     / |    | /   / =/     ]],
  -- [[       | ::|    |      \    \ \    \ `--' =/      ]],
  -- [[      /  '/\    /       )    |/     `-...-`       ]],
  -- [[     /    | |  `\    /-'    /;                    ]],
  -- [[     \  ,,/ |    \   D    .'  \                   ]],
  -- [[  jgs `""`   \  nnh  D_.-'L__nnh                  ]],
  -- [[              `"""`                               ]],
}
dashboard.section.buttons.val = {
  dashboard.button("s", "🚀 Load load session", ":SessionManager load_last_session<CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep<CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	return 'Joban Mendpara'
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
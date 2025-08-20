local cmd = require('utils').cmd

local M = {
  "shortcuts/no-neck-pain.nvim",
  event = "VeryLazy",
  version = "*",
  enabled = true,
  config = function()
    require("no-neck-pain").setup({
      autocmds = {
        enableOnVimEnter = false,
        enableOnTabEnter = false,
        reloadOnColorSchemeChange = true,
      },
      width = 120,
    })
  end,
  keys = {
    { "<M-c>", cmd('NoNeckPain'), desc = "Center Window" }
  }
}

return M

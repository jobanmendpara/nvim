local M = {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
}

return M

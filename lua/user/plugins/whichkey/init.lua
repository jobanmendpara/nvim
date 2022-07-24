local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local icons = require('user.misc.icons')
local mappings = require('user.plugins.whichkey.keymaps')

which_key.setup({
  icons = {
    breadcrumb = icons.breadcrumb,
    seperator = icons.git.renamed,
    group = '+',
  },
  ignore_missing = true,
  mappings = mappings,
  triggers = 'auto',
  show_help = true,
  window = {
    border = 'rounded',
    position = 'bottom',
    margin = {1, 0, 1, 0},
    padding = {2, 2, 2, 2,},
    winblend = 0,
  },
  popup_mappings = mappings.popup_mappings,
})

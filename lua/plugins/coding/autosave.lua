return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0",
  cmd = "ASToggle",
  event = "VeryLazy",
  opts = {
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" }) then
        return true
      end
      return false
    end,
  },
}

local M = {
  "gbprod/cutlass.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    cut_key = "x",
    override_del = nil,
    exclude = {},
    registers = {
      select = "_",
      delete = "_",
      change = "_",
    },
  },
  keys = {
    {
      "x",
      "d",
      desc = "Cut",
      mode = "n",
    },
    {
      "x",
      "d",
      desc = "Cut",
      mode = "x",
    },
    {
      "xx",
      "dd",
      desc = "Cut Line",
      mode = "n",
    },
    {
      "X",
      "D",
      desc = "Cut to EOL",
      mode = "n",
    },
  },
}

return M

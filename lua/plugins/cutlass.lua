local M = {
  "gbprod/cutlass.nvim",
  event = "BufReadPre",
  config = function ()
    require("cutlass").setup({
      cut_key = "x",
      override_del = nil,
      exclude = {},
    })
  end
}

return M

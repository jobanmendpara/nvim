return {
  "gbprod/cutlass.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    cut_key = "x",
    override_del = true,
    exclude = {},
    registers = {
      select = "_",
      delete = "_",
      change = "_",
    },
  },
}

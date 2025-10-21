return {
  "nvim-mini/mini.operators",
  version = "*",
  event = "VeryLazy",
  enabled = true,
  opts = {
    exchange = {
      prefix = "gx",
      reindent_linewise = true,
    },
    sort = {
      prefix = "gs",
      func = nil,
    },
  },
}

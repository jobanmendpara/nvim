return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    spec = {
      {
        mode = "n",
        { "<leader>,", group = "editor" },
      },
      {
        mode = "v",
        { "gs", group = "sort" },
      },
    },
  },
}

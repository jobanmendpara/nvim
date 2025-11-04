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
  keys = {
    {
      "[",
      function()
        require("which-key").show({ keys = "[", loop = true })
      end,
      desc = "Previous",
    },
    {
      "]",
      function()
        require("which-key").show({ keys = "]", loop = true })
      end,
      desc = "Next",
    },
  },
}

return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  enabled = true,
  keys = {
    {
      "<S-h>",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Next File",
    },
    {
      "<S-l>",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Next File",
    },
  },
}

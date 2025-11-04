return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  cmd = "Telescope",
  keys = {
    {
      "<leader>,",
      "<Nop>",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
        horizontal = {
          preview_width = 0.5,
        },
      },
      preview = true,
    },
  },
}

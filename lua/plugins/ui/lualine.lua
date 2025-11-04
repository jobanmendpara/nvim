return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    options = {
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_c = {
        "diagnostics",
      },
    },
    tabline = {
      lualine_c = {
        "tabs",
      },
    },
  },
}

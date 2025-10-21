return {
  "nvim-mini/mini.surround",
  version = "*",
  event = "VeryLazy",
  enabled = false,
  opts = {
    custom_surroundings = nil,
    highlight_duration = 500,
    mappings = {
      add = "<leader>Sa", -- Add surrounding in Normal and Visual modes
      delete = "<leader>Sd", -- Delete surrounding
      find = "<leader>Sf", -- Find surrounding (to the right)
      find_left = "<leader>SF", -- Find surrounding (to the left)
      highlight = "<leader>Sh", -- Highlight surrounding
      replace = "<leader>Sr", -- Replace surrounding
      update_n_lines = "<leader>Sn", -- Update `n_lines`
      suffix_last = "l", -- Suffix to search with "prev" method
      suffix_next = "n", -- Suffix to search with "next" method
    },
    n_lines = 20,
    search_method = "cover",
    silent = false,
  },
}

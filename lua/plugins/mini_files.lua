local M = {
  "echasnovski/mini.files",
  event = "VeryLazy",
  enabled = false,
  config = true,
  keys = {
    {
      "<leader>e",
      "<CMD>lua MiniFiles.open()<CR>",
      desc = "Open Explorer",
      mode = "n",
    }
  }
}

return M

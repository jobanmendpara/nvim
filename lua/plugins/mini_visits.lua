local M = {
  "echasnovski/mini.visits",
  event = "VeryLazy",
  config = function()
    require("mini.visits").setup({
      track = { event = "" },
    })
  end,
  keys = {
    {
      ">",
      function()
        local mini = require("mini.visits")
        local buf = vim.api.nvim_get_current_buf()
        local path = vim.api.nvim_buf_get_name(buf)
        local exists = false
        for _, p in ipairs(mini.list_paths()) do
          if p == path then
            exists = true; break
          end
        end
        if exists then
          vim.notify("Unmark File")
          mini.remove_path()
        else
          vim.notify("Mark File")
          mini.register_visit()
        end
      end,
      desc = "Mark/Unmark file",
      mode = "n",
      silent = true,
    },
  },
}

return M

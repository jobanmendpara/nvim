local M = {
  "TimUntersberger/neogit",
  event = "VimEnter",
  config = function ()
    require("neogit").setup()
  end
}

return M

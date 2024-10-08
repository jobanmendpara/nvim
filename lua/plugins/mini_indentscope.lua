local M = {
  "echasnovski/mini.indentscope",
  event = "VeryLazy",
	enabled = true,
  config = function ()
    require("mini.indentscope").setup({
      draw = {
        delay = 100,
        priority = 2,
      },
      mappings = {
        object_scope = 'ii',
        object_scope_with_border = 'ai',
        goto_top = '[i',
        goto_bottom = ']i',
      },
      options = {
        border = 'both',
        indent_at_cursor = true,
        try_as_border = false,
      },
      symbol = '│',
    })
  end,
}

return M

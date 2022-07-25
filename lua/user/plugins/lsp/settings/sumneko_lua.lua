return {
  Lua = {
    diagnostics = {
      globals = {'vim', 'use', 'require'}
    },
    format = true,
    workspace = {
      library = {
        [vim.fn.expand '$VIMRUNTIME/lua'] = true,
        [vim.fn.stdpath 'config' .. '/lua'] = true,
      },
    },
  },
  telemetry = {
    enable = false,
  },
}

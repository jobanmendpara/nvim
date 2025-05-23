local M = {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = true,
  },
  {
    'williamboman/mason.nvim',
    lazy = true,
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            enabled = true,
            style = 'solid',
          },
          mappings = {
            enabled = true,
            priority = 100,
          },
          sidebar = {
            enabled = true,
            width = 40,
            position = 'left',
          },
          floating = {
            enabled = true,
            border = 'single',
            max_height = math.floor(vim.o.lines * 0.5),
            max_width = math.floor(vim.o.columns * 0.4),
          },
          window = {
            border = 'single',
            max_height = math.floor(vim.o.lines * 0.5),
            max_width = math.floor(vim.o.columns * 0.4),
          },
        },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local nvim_lsp = require('lspconfig')
      lsp_zero.extend_lspconfig()
      require('mason-lspconfig').setup({
        ensure_installed = {
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            nvim_lsp.lua_ls.setup(lua_opts)
          end,
          denols = function()
            nvim_lsp.denols.setup({
              root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
              filetypes = { 'typescript', 'javascript' },
            })
          end,
          ts_ls = function()
            nvim_lsp.ts_ls.setup({
              root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json"),
              single_file_support = false,
              handlers = {
                ["textDocument/publishDiagnostics"] = function(
                    _,
                    result,
                    ctx,
                    config
                )
                  if result.diagnostics == nil then
                    return
                  end

                  -- ignore some ts_ls diagnostics
                  local idx = 1
                  while idx <= #result.diagnostics do
                    local entry = result.diagnostics[idx]

                    -- local formatter = require('format-ts-errors')[entry.code]
                    -- entry.message = formatter and formatter(entry.message) or entry.message

                    -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
                    if entry.code == 80001 then
                      -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
                      table.remove(result.diagnostics, idx)
                    else
                      idx = idx + 1
                    end
                  end

                  vim.lsp.diagnostic.on_publish_diagnostics(
                    _,
                    result,
                    ctx,
                    config
                  )
                end,
              },
              init_options = {
                plugins = {
                  {
                    name = '@vue/typescript-plugin',
                    location = require('mason-registry').get_package('vue-language-server'):get_install_path(),
                    languages = { 'vue' },
                  },
                },
              },
              filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' },
            })
          end,
        }
      })

      local signs = require("utils").lsp_signs

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local function enhanced_float_handler(handler)
        return function(err, result, ctx, config)
          local buf, win = handler(
            err,
            result,
            ctx,
            vim.tbl_deep_extend('force', config or {}, {
              border = 'rounded',
              max_height = math.floor(vim.o.lines * 0.5),
              max_width = math.floor(vim.o.columns * 0.4),
            })
          )

          if not buf or not win then
            return
          end

          -- Conceal everything.
          vim.wo[win].concealcursor = 'n'

          -- Extra highlights.
          -- INFO: Disabled due to invalid namepsace id (md_namespace)
          -- for l, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
          --   for pattern, hl_group in pairs {
          --     ['|%S-|'] = '@text.reference',
          --     ['@%S+'] = '@parameter',
          --     ['^%s*(Parameters:)'] = '@text.title',
          --     ['^%s*(Return:)'] = '@text.title',
          --     ['^%s*(See also:)'] = '@text.title',
          --     ['{%S-}'] = '@parameter',
          --   } do
          --     local from = 1 ---@type integer?
          --     while from do
          --       local to
          --       from, to = line:find(pattern, from)
          --       if from then
          --         vim.api.nvim_buf_set_extmark(buf, md_namespace, l - 1, from - 1, {
          --           end_col = to,
          --           hl_group = hl_group,
          --         })
          --       end
          --       from = to and to + 1 or nil
          --     end
          --   end
          -- end

          -- Add keymaps for opening links.
          if not vim.b[buf].markdown_keys then
            vim.keymap.set('n', 'K', function()
              -- Vim help links.
              local url = (vim.fn.expand '<cWORD>' --[[@as string]]):match '|(%S-)|'
              if url then
                return vim.cmd.help(url)
              end

              -- Markdown links.
              local col = vim.api.nvim_win_get_cursor(0)[2] + 1
              local from, to
              from, to, url = vim.api.nvim_get_current_line():find '%[.-%]%((%S-)%)'
              if from and col >= from and col <= to then
                vim.system({ 'open', url }, nil, function(res)
                  if res.code ~= 0 then
                    vim.notify('Failed to open URL' .. url, vim.log.levels.ERROR)
                  end
                end)
              end
            end, { buffer = buf, silent = true })
            vim.b[buf].markdown_keys = true
          end
        end
      end

      vim.lsp.handlers["textDocument/hover"] = enhanced_float_handler(vim.lsp.handlers.hover)
      vim.lsp.handlers["textDocument/signatureHelp"] = enhanced_float_handler(vim.lsp.handlers.signature_help)
    end,
  }
}

return M

local cmp_status_ok, cmp = pcall(require, 'cmp')
local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
local snip_status_ok, luasnip = pcall(require, "luasnip")

if not snip_status_ok then
  return
end
if not (cmp_status_ok or cmp_nvim_lsp_status_ok or lspconfig_status_ok or snip_status_ok) then
    return
end

local kind_icons = require('user.misc.icons').kind_icons
local mappings = require('user.plugins.completion.keymaps')
require("luasnip/loaders/from_vscode").lazy_load()


cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    sources = {{
        name = 'nvim_lsp'
    }, {
        name = 'nvim_lua'
    }, {
        name = 'luasnip'
    }, {
        name = 'buffer',
        keyword_length = 5,
    }, {
        name = 'path',
        keyword_length = 5,
    }, {
        name = 'rg'
    }},
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[API]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    mapping = cmp.mapping.preset.insert(mappings),
    window = {
      documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
        winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None"
      },
      completion = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
        winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None"
      }
    },
})


cmp.setup.cmdline('/', {
    sources = {{
        name = 'buffer'
    }}
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{
        name = 'path'
    }}, {{
        name = 'cmdline'
    }})
})


--local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
--lspconfig['sumneko-lua'].setup({
--    capabilities = capabilities
--})

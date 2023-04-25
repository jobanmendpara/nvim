local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local lualine_selectioncount = require("lualine.components.selectioncount")
    local codicons = require("codicons")
    local navic = require("nvim-navic")

    local branch = {
      "branch",
      icons_enabled = true,
      icon = codicons.get("git-branch"),
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      colored = true,
      update_in_insert = false,
      always_visible = true,
    }

    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    local diff = {
      "diff",
      colored = true,
      separator = "%#SLSeparator#" .. "│ " .. "%*",
      symbols = {
        added = codicons.get("diff-added") .. " ",
        modified = codicons.get("diff-modified") .. " ",
        removed = codicons.get("diff-removed") .. " ",
      },
      source = diff_source
    }

    local location = { "location", padding = 0 }

    local filename = { "filename", path = 4 }

    local function selectionCount()
      if lualine_selectioncount() == "" then
        return 0
      else
        return lualine_selectioncount()
      end
    end

    return {
      options = {
        always_divide_middle = true,
        component_separators = "",
        disabled_filetypes = {},
        globalstatus = true,
        icons_enabled = true,
        section_separators = "",
        theme = "auto",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch },
        lualine_c = { diagnostics },
        lualine_x = { "filetype" },
        lualine_y = { diff },
        lualine_z = { selectionCount, location },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          filename,
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          filename,
          { navic.get_location, cond = navic.is_available },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "lazy" },
    }
  end,
}

return M

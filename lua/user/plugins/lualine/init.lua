local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local icons = require('user.misc.icons')

local diagnostics = {
    'diagnostics',
    sources = {'nvim_diagnostic'},
    sections = {'error', 'warn', 'info', 'hint'},
    symbols = {
        error = icons.error_lg,
        warn = icons.warn_lg,
        info = icons.information_lg,
        hint = icons.hint_lg
    },
    colored = false,
    update_in_insert = false,
    always_visible = true
}

local diff = {
    'diff',
    colored = true,
    symbols = {
        added = icons.diff_add,
        modified = icons.diff_modified,
        removed = icons.diff_remove
    },
    cond = hide_in_width,
    separator = ''
}

local mode = {function(str)
    return icons.evil
end}

local filetype = {
    'filetype',
    colored = false,
    icons_enabled = true
}

local filename = {
    'filename',
    symbols = {
        modified = '',
        readonly = '',
        unnamed = '[New Document]'
    }
}

local branch = {
    'branch',
    icons_enabled = true,
    icon = ''
}

local location = {
    'location',
    padding = 1
}

-- cool function for progress
local progress = function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local chars = {'__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██'}
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local spaces = {
    function()
        return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
    end,
    padding = 1,
    separator = '-'
}

lualine.setup({
    options = {
        always_divide_middle = true,
        component_separators = {
            left = '',
            right = ''
        },
        disabled_filetypes = {'alpha', 'Outline'},
        globalstatus = true,
        icons_enabled = true,
        section_separators = {
            left = '',
            right = ''
        },
        theme = 'auto'
    },
    sections = {
        lualine_a = {mode, branch, diagnostics},
        lualine_b = {filename},
        lualine_c = {},
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_x = {diff, location},
        lualine_y = {spaces, 'encoding'},
        lualine_z = {filetype, 'fileformat'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})

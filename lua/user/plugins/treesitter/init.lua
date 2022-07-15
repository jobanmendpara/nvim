local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

treesitter.setup({
    autopairs = {
        enable = true
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
      enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = false
    },
    index = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  "
            }
        },
        icons = {
            webdev_colors = true
        }
    }
})

-- Enable folds
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

local function temp()
    print('hello world!')
end

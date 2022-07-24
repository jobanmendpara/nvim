local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
    return
end

local icons = require('user.misc.icons')

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = true,
    open_on_tab = false,
    sort_by = 'name',
    update_cwd = true,
    view = {
        hide_root_folder = false,
        height = 30,
        width = 30,
        side = 'left',
        preserve_window_proportions = false,
        number = true,
        relativenumber = false,
        signcolumn = 'yes',
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            }
        }
    },
    renderer = {
        highlight_git = true,
        full_name = true,
        indent_markers = {
            enable = false,
            icons = {
                corner = '└ ',
                edge = '│ ',
                item = '│ ',
                none = ' ',
            },
        },
        icons = {
            webdev_colors = true,
            glyphs = {
                default = '',
                symlink = icons.symlink,
                git = icons.git,
                folder = icons.folder
            }
        }
    },
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },
    ignore_ft_on_setup = {'alpha'},
    system_open = {
        cmd = '',
        args = {}
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = icons.hint,
            info = icons.info,
            warning = icons.warn,
            error = icons.error
        }
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {}
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                exclude = {
                    filetype = {'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame'},
                    buftype = {'nofile', 'terminal', 'help'}
                }
            }
        }
    },
    trash = {
        cmd = 'trash',
        require_confirm = true
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false
        }
    }
})

require('user.plugins.nvim-tree.keymaps')

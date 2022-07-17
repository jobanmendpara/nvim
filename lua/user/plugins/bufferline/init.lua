local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

bufferline.setup({
    options = {
        always_show_bufferline = true,
        buffer_close_icon = '',
        close_icon = '',
        close_command = 'bdelete! %d',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return '(' .. count .. ')'
        end,
        enforce_regular_tabs = true,
        left_mouse_command = 'buffer %d',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 30,
        max_prefix_length = 30,
        offsets = {{
            filetype = 'NvimTree',
            text = '',
            padding = 1
        }, {
            filetype = 'Outline',
            text = '',
            padding = 1
        }},
        middle_mouse_command = 'bdelete! %d',
        modified_icon = '',
        numbers = 'none',
        tab_size = 21,
        separator_style = 'thin',
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true
    }
})

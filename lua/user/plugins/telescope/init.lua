local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.load_extension("media_files")
local actions = require "telescope.actions"
local icons = require('user.misc.icons')

telescope.setup({
  defaults = {
    prompt_prefix = icons.telescope,
    selection_caret = icons.selection_caret,
    path_display = { 'smart' },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
  pickers = {
  },
})

telescope.load_extension('fzf');

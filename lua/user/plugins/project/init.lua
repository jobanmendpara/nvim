local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

project.setup({
  active = true,
  on_config_done = nil,
  manual_mode = false,
  detection_methods = { 'pattern' },
  patterns = { '.git' , 'package.json', 'Makefile'},
  show_hidden = true,
  silent_chdir = true,
  ignore_lsp = {},
  datapath = vim.fn.stdpath('data'),
})

function _ADD_CURR_DIR_TO_PROJECTS()
  local historyfile = require("project_nvim.utils.path").historyfile
  local curr_directory = vim.fn.expand("%:p:h")
  vim.cmd("!echo " .. curr_directory .. " >> " .. historyfile)
end

vim.cmd("command! ProjectAddMuanually lua _ADD_CURR_DIR_TO_PROJECTS()")

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension('projects')

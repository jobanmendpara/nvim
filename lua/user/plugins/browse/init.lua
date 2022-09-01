local status_ok, browse = pcall(require, "browse")
if not status_ok then
  return
end

browse.setup({
    provider = "chrome",
  }
)

local bookmarks = {
  'https://www.github.com/jobanmendpara',
  'https://www.github.com/cardinalManagement',
  'https://github.com/rockerBOO/awesome-neovim',
}

vim.api.nvim_create_user_command('BrowseInputSearch', function()
  browse.input_search()
end, {})

vim.api.nvim_create_user_command('Browse', function()
  browse.browse({bookmarks = bookmarks})
end, {})

vim.api.nvim_create_user_command('BrowseBookmarks', function()
  browse.open_bookmarks({bookmarks = bookmarks})
end, {})

vim.api.nvim_create_user_command('BrowseDevDocsSearch', function()
  browse.devdocs.search()
end, {})

vim.api.nvim_create_user_command('BrowseDevDocsFileTypeSearch', function()
  browse.devdocs.search_with_filetype()
end, {})

vim.api.nvim_create_user_command('BrowseMDNSearch', function()
  browse.mdn.search()
end, {})


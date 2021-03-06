local fn = vim.fn

-- Auto install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  print("Installing Packer. Please restart NeoVim.")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error on the first use
local status_ok, packer = pcall(require, "packer")

if not status_ok then
  vim.notify("The protected call for Packer failed.")
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install packages here
return packer.startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")
  ----------------------------
  -- My Plugins
  ----------------------------
  use("lewis6991/gitsigns.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("goolord/alpha-nvim")
  use("nvim-lua/plenary.nvim")
  use("ahmedkhalf/project.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("folke/which-key.nvim")
  use("windwp/nvim-autopairs")
  use("nvim-treesitter/nvim-treesitter")
  use("p00f/nvim-ts-rainbow")
  use("windwp/nvim-ts-autotag")
  use("lukas-reineke/indent-blankline.nvim")
  use("akinsho/bufferline.nvim")
  use("nvim-lualine/lualine.nvim")
  use("phaazon/hop.nvim")
  use("akinsho/toggleterm.nvim")
  use("moll/vim-bbye")
  use("yamatsum/nvim-cursorline")
  use("antoinemadec/FixCursorHold.nvim")
  use("lewis6991/impatient.nvim")
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("ur4ltz/surround.nvim")
  use("ggandor/leap.nvim")
  -- use("Pocco81/AutoSave.nvim")
  -- use("McAuleyPenney/tidy.nvim")
  use("Shatur/neovim-session-manager")
  use("folke/trouble.nvim")
  use("rcarriga/nvim-notify")
  use("karb94/neoscroll.nvim")
  use("nacro90/numb.nvim")
  use("folke/todo-comments.nvim")
  use("andweeb/presence.nvim")
  use("sunjon/Shade.nvim")
  use("folke/twilight.nvim")
  use("norcalli/nvim-colorizer.lua")

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-media-files.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-nvim-lsp")
  use("lukas-reineke/cmp-rg")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("tamago324/nlsp-settings.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use("RishabhRD/popfix")
  use("RishabhRD/nvim-lsputils")

  -- Color Schemes
  use("folke/tokyonight.nvim")
  use("projekt0n/github-nvim-theme")
  use("overcache/NeoSolarized")
  use("sainnhe/sonokai")
  use("sainnhe/gruvbox-material")
  use("sainnhe/everforest")
  use("sainnhe/edge")
  use("rmehri01/onenord.nvim")
  use("ChristianChiarulli/nvcode-color-schemes.vim")
  use("rose-pine/neovim")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

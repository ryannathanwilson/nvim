require("packer").startup(function()
  -- Packer manages packer
  use("wbthomason/packer.nvim")


  -- Colorscheme
  use("gruvbox-community/gruvbox")
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use("folke/tokyonight.nvim")
  -- use("mhinz/vim-startify")
  use("sainnhe/everforest")
  -- use({
  --   "neanias/everforest-nvim",
  --   -- Optional; default configuration will be used if setup isn't called.
  -- })
  use("tomasr/molokai")
  use("gmr458/dark_modern.nvim")

  -- Icons
  use("kyazdani42/nvim-web-devicons")

  -- Language
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/vim-vsnip")
  use("hrsh7th/cmp-nvim-lsp")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use('jose-elias-alvarez/null-ls.nvim')
  use("MunifTanjim/prettier.nvim")

  -- Telescope
  use("nvim-lua/telescope.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "makes" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })

  -- Utilities
  use("terrortylor/nvim-comment")
  use("nvim-lualine/lualine.nvim")
  use("windwp/nvim-autopairs")
  use("kyazdani42/nvim-tree.lua")
  use("ThePrimeagen/harpoon")
  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use({
    "epwalsh/obsidian.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  -- GIT
  use("tpope/vim-fugitive")
  -- use("sindrets/diffview.nvim") -- required for neogit
  -- use("lewis6991/gitsigns.nvim")
  use("APZelos/blamer.nvim")

  -- Start Screen
  use({
    "goolord/alpha-nvim",
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("alpha").setup(require 'alpha.themes.dashboard'.config)
    end,
  })

  -- Supporting
  use("nvim-lua/plenary.nvim") -- required for telescope and neogit
  use("nvim-lua/popup.nvim")   -- required for telescope
end)

require 'rnw.plugin_config'

require("packer").startup(function()
  -- Packer manages packer
  use("wbthomason/packer.nvim")


  -- Colorscheme
  use("gruvbox-community/gruvbox")
  use("folke/tokyonight.nvim")
  use("mhinz/vim-startify")
  use("sainnhe/everforest")
  use("tomasr/molokai")

  -- Icons
  use("kyazdani42/nvim-web-devicons")

  -- Language
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/vim-vsnip")
  use("hrsh7th/cmp-nvim-lsp")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use({"mfussenegger/nvim-jdtls",
    config = function()
    require("plugin.jdtls.config").atach()
    end,
    module = "jdtls",
  })

  -- Telescope
  use("nvim-lua/telescope.nvim")
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "makes"})
  use({"nvim-telescope/telescope-file-browser.nvim"})

  -- Utilities
  use("APZelos/blamer.nvim")
  use("terrortylor/nvim-comment")
  use("nvim-lualine/lualine.nvim")
  use("windwp/nvim-autopairs")
  use("kyazdani42/nvim-tree.lua")

  -- GIT
  use("TimUntersberger/neogit")
  -- use("tpope/vim-fugitive")
  use("sindrets/diffview.nvim") -- required for neogit
  use("lewis6991/gitsigns.nvim")


  -- Supporting
  use("nvim-lua/plenary.nvim") -- required for telescope and neogit
  use("nvim-lua/popup.nvim") -- required for telescope
end)

require('rnw.plugin_options')

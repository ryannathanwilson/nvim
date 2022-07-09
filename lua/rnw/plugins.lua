require("packer").startup(function()
  -- Packer manages packer
  use("wbthomason/packer.nvim")


  -- Colorscheme
  use("gruvbox-community/gruvbox")
  use("mhinz/vim-startify")

  -- Icons
  use("kyazdani42/nvim-web-devicons")

  -- Language
  use("neovim/nvim-lspconfig")
  use("nvim-lua/completion-nvim")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  -- Telescope
  use("nvim-lua/telescope.nvim")
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "makes"}
  use {"nvim-telescope/telescope-file-browser.nvim"}

  -- Utilities
  use("APZelos/blamer.nvim")
  use("terrortylor/nvim-comment")
  use("nvim-lualine/lualine.nvim")
  use("windwp/nvim-autopairs")

  -- GIT
  use("TimUntersberger/neogit")
  use("sindrets/diffview.nvim") -- required for neogit
  use("lewis6991/gitsigns.nvim")


  -- Supporting
  use("nvim-lua/plenary.nvim") -- required for telescope and neogit
  use("nvim-lua/popup.nvim") -- required for telescope
end)

require('rnw.plugin_options')

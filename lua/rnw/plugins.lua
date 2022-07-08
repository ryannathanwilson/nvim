return require("packer").startup(function()
  -- Packer manages packer
  use("wbthomason/packer.nvim")


  -- Colorscheme
  use("gruvbox-community/gruvbox")

  -- Language
  -- def needs configuring
  use("neovim/nvim-lspconfig")
  use("nvim-lua/completion-nvim")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })


  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/telescope.nvim")
  -- probably requires some configuration
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- use("nvim-telescope/telescope-fzf-native.nvim", { run = 'make' })

  -- Utilities
  use("APZelos/blamer.nvim")
  

end)


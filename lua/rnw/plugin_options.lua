-- Plugins with their own config file
require("rnw.telescope")
require("rnw.lang")
require("rnw.keymap")
require("rnw.git")

-- Simple config
require("nvim_comment").setup()
require("nvim-autopairs").setup()
-- TODO: configure for fastwrap

require("lualine").setup({
  options = {
    theme = 'gruvbox',
    section_separators = '',
    component_separators = '',
  },
})


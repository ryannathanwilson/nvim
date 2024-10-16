-- Treesitter
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
  incremental_selection = {
    enable = false,
  },
  ensure_installed = { 'javascript', 'typescript', 'lua', 'rust', 'markdown' }
})

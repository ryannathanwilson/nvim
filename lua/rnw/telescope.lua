require('telescope').setup({
  defaults = {
    prompt_prefix = "=> "
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
  },
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
-- TODO: add more extensions?

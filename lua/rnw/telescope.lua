local M = {}
local actions = require'telescope.actions'

require('telescope').setup({
  defaults = {
    path_display = { "truncate" },
    layout_config = {
      width = 0.8,
      prompt_position = "top",
      preview_width = 0.5,
    },
    sorting_strategy = "ascending",
    prompt_prefix = "=> ",
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      }
    }
  },
})


require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
-- TODO: add more extensions?


return M

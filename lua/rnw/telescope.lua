local M = {}
local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
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
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
  },
})

-- Find files
M.files = function()
  require('telescope.builtin').find_files()
end

-- Find words
M.words = function()
  require('telescope.builtin').live_grep()
end

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
-- TODO: add more extensions?


return M

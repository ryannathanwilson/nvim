local M = {}
local actions = require'telescope.actions'
local utils = require'telescope.utils'
local builtin = require'telescope.builtin'

function M.find_project_files()
  local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
  if ret == 0 then 
      builtin.git_files() 
  else 
      builtin.find_files() 
  end 
end

require('telescope').setup({
  defaults = {
    color_devicons = true,
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
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default,
      },
      n = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        --@usage don't include the filename in the search results
        only_sort_text = true,
      },
      grep_string = {
        only_sort_text = true,
      },
      buffers = {
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      planets = {
        show_pluto = true,
        show_moon = true,
      },
      git_files = {
        hidden = true,
        show_untracked = true,
      },
      colorscheme = {
        enable_preview = true,
      },
    },
  },
})


require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
-- TODO: add more extensions?


return M

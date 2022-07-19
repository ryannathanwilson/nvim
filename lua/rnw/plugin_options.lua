local M = {} -- Export functions for keymaps

-- ================================== --
-- Plugins with their own config file --
-- ================================== --
require("rnw.telescope")
require("rnw.lang")

-- ================================== --
-- GIT --
-- ================================== --
require('neogit').setup({
  kind = 'vsplit',
  integrations = {
      diffview = true
    },
})
require('gitsigns').setup()
local gs = package.loaded.gitsigns
M.gitsigns = {
  loaded = gs,
  next_hunk = function()
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end,
  prev_hunk = function()
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end,
}

-- ================================== --
-- NVIM Comment --
-- ================================== --
require("nvim_comment").setup()

-- ================================== --
-- NVIM Autopairs --
-- auto-closes parantheses and quotes
-- ================================== --
require("nvim-autopairs").setup()
-- TODO: configure for fastwrap

-- ================================== --
-- LuaLine --
-- Status bar
-- ================================== --
require("lualine").setup({
  options = {
    -- theme = 'tokyonight',
    theme = 'gruvbox',
    section_separators = '', -- can change to look more like airline
    component_separators = '', -- can change to look more like airline
  },
})


-- ================================== --
-- NVIM-Tree --
-- ================================== --
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  open_on_setup = true,
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

return M

local M = {} -- Export functions for keymaps

-- ================================== --
-- Plugins with their own config file --
-- ================================== --
require("rnw.telescope")
require("rnw.lang")

-- ================================== --
-- GIT --
-- ================================== --
--
--

-- require('neogit').setup({
--   kind = 'vsplit',
--   integrations = {
--       diffview = true
--     },
-- })
-- require('gitsigns').setup()
-- local gs = package.loaded.gitsigns
-- M.gitsigns = {
--   loaded = gs,
--   next_hunk = function()
--     vim.schedule(function() gs.next_hunk() end)
--     return '<Ignore>'
--   end,
--   prev_hunk = function()
--     vim.schedule(function() gs.prev_hunk() end)
--     return '<Ignore>'
--   end,
-- }
--
-- require('diffview').setup({
--   hooks = {
--     view_opened = function(view)
--       local DiffView = require("diffview.views.diff.diff_view").DiffView
--       if view:instanceof(DiffView) then
--         -- Refresh diffview when the git index changes:
--         local watcher = vim.loop.new_fs_poll()
--         watcher:start(view.git_dir .. "/index", 1000, function(err, prev, cur)
--           if not err then
--             vim.schedule(function()
--               vim.cmd("DiffviewRefresh")
--             end)
--           end
--         end)
--
--         -- Stop the watcher when the view closes:
--         DiffviewGlobal.emitter:on("view_closed", function(v)
--           if v == view then
--             watcher:stop()
--           end
--         end)
--       end
--     end,
--   },
-- })

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
  open_on_setup = false,
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "after",
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
})

return M

local map = vim.keymap.set
local plugin_options = require'rnw.plugin_options'

-- Leader
vim.g.mapleader = " "

-- Indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Esc
map('i', 'jk', '<Esc>')

-- Window management
map('n', '<leader>,', '<cmd>wincmd w<CR>')
map('n', '<C-W>', '<cmd>wincmd w<CR>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

-- Previous file toggle
map('n', '<leader>l', '<c-^><CR>')

-- Next buffer
map('n', '<leader>n', '<cmd>bn<CR>')

-- Delete current buffer
map('n', '<leader>bd', '<cmd>bd<CR>')

-- GIT
local gitsigns = plugin_options.gitsigns
map('n', '<leader>dv', '<cmd>DiffviewOpen<CR>')
map('n', '<leader>hn', gitsigns.next_hunk, {expr=true})
map('n', '<leader>hp', gitsigns.prev_hunk, {expr=true})

map({'n', 'v'}, '<leader>hs', gitsigns.loaded.stage_hunk)
map({'n', 'v'}, '<leader>hr',gitsigns.loaded.reset_hunk)
map('n', '<leader>hu', gitsigns.loaded.undo_stage_hunk)

map('n', '<leader>hS', gitsigns.loaded.stage_buffer)
map('n', '<leader>hR', gitsigns.loaded.reset_buffer)
map('n', '<leader>hp', gitsigns.loaded.preview_hunk)
map('n', '<leader>hb', function() gitsigns.loaded.blame_line{full=true} end)
map('n', '<leader>tb', gitsigns.loaded.toggle_current_line_blame)
map('n', '<leader>hd', gitsigns.loaded.diffthis)
map('n', '<leader>hD', function() gitsigns.loaded.diffthis('~') end)
map('n', '<leader>td', gitsigns.loaded.toggle_deleted)


-- Search
map('n', '<c-/>', "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map('n', '<c-f>', '<cmd>lua require("rnw.telescope").files()<CR>')
map('n', '<leader>g', '<cmd>lua require("rnw.telescope").words()<CR>')

-- Comment toggle
map('n', '++', '<cmd>CommentToggle<CR>')
map('v', '++', ':CommentToggle<CR>')

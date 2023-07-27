local map = vim.keymap.set
-- local plugin_options = require 'rnw.plugin_options'

-- Leader
vim.g.mapleader = " "

-- Indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Esc
map('i', 'jk', '<Esc>')

-- Window management
map('n', '<leader><leader>', '<cmd>wincmd w<CR>')
map('n', '<C-W>', '<cmd>wincmd w<CR>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

-- Previous file toggle
map('n', '<leader>l', '<C-t><CR>')
map('n', '^', '<C-o><CR>')

-- Next buffer
map('n', '<leader>bn', '<cmd>bn<CR>')

-- Delete current buffer
map('n', '<leader>c', '<cmd>bd<CR>')

-- Print path of current buffer
map('n', '<leader>pwd', '<cmd>echo expand("#1:p")<CR>')

-- NVIM-Tree
map('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>')

-- GIT

-- map('n', '<leader>gs', '<cmd>tab Git<CR>')
map('n', '<leader>gs', '<cmd>LazyGit<CR>')

-- Search
map('n', '<leader>s/', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>sf', '<cmd> lua require("rnw.plugin_config.telescope").find_project_files()<CR>')
-- map('n', '<leader>f', function() vim.cmd [[Telescope find_files]] end)
map('n', '<leader>st', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>sb', '<cmd>Telescope buffers<CR>')
map('n', 'gr', '<cmd>Telescope lsp_references<CR>')

-- Comment toggle
map('n', '++', '<cmd>CommentToggle<CR>')
map('v', '++', ':CommentToggle<CR>')

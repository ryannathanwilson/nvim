local map = require("rnw.utils").map

-- Leader
vim.g.mapleader = ","

-- Search
map('n', '<c-/>', "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map('n', '<c-f>', '<cmd>lua require("rnw.telescope").files()<CR>')
map('n', '<leader>g', '<cmd>lua require("rnw.telescope").words()<CR>')

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

-- Comment toggle
map('n', '++', '<cmd>CommentToggle<CR>')
map('v', '++', ':CommentToggle<CR>')

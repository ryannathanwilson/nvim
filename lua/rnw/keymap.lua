local map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Leader
vim.g.mapleader = ","

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

-- Next in buffer
map('n', '<leader>n', '<cmd>bn<CR>')

-- Delete current buffer
map('n', '<leader>bd', '<cmd>bd<CR>')

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

-- Next window
map('n', '<leader>,', '<cmd>wincmd w<CR>')
map('n', '<c-w>', '<cmd>wincmd w<CR>')

-- Previous file toggle
map('n', '<leader>l', '<c-^><CR>')

-- Next in buffer
map('n', '<leader>n', '<cmd>bn<CR>')

-- Delete current buffer
map('n', '<leader>bd', '<cmd>bd<CR>')

return {
  "terrortylor/nvim-comment",
  config = function()
    require("nvim_comment").setup()
    vim.keymap.set('n', '++', '<cmd>CommentToggle<CR>')
    vim.keymap.set('v', '++', ':CommentToggle<CR>')
  end
}

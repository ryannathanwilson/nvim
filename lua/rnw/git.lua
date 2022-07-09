local map = require("rnw.utils").map

require('neogit').setup({
  integrations = {
    diffview = true  
  },
})

map('n', '<leader>gs', '<cmd>Neogit<CR>')



require('gitsigns').setup({})

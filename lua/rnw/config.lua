local o = vim.opt
o.autoindent = true
o.autoread = true
o.expandtab = true
o.hidden = true
o.errorbells = false
o.hlsearch = false
o.incsearch = true
o.nu = true
o.relativenumber = true
o.scrolloff = 8
o.signcolumn = 'yes'
o.shiftwidth = 2
o.smartindent = true
o.softtabstop = 2
o.tabstop = 2
o.undofile = true
o.splitbelow = true
o.splitright = true
o.wrap = false
o.mouse = 'a'

-- use y and p with the system clipboard
o.clipboard = "unnamedplus"

o.laststatus = 3
vim.cmd [[highlight WinSeparator guibg=NONE]]

-- ===================================
-- COLORSCHEME
-- Update LuaLine theme as well
-- ===================================


-- EVERFOREST
vim.cmd [[colorscheme everforest]]

-- ROSE PINE
-- vim.cmd [[colorscheme rose-pine]]

-- TOKYO NIGHT
-- vim.g.tokyonight_style = "night"
-- vim.cmd [[colorscheme tokyonight]]

-- GRUVBOX
-- vim.cmd [[let g:gruvbox_sign_column = 'bg0']]
-- vim.cmd [[colorscheme gruvbox]]
vim.cmd [[let g:gruvbox_sign_column = 'bg0']]
vim.cmd [[colorscheme gruvbox]]

-- BLAMER
vim.cmd [[let g:blamer_enabled = 1]]


vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

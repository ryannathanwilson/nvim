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
-- vim.cmd [[colorscheme everforest]]

-- TOKYO NIGHT
-- vim.g.tokyonight_style = "night"
-- vim.cmd [[colorscheme tokyonight]]

-- GRUVBOX
vim.cmd [[let g:gruvbox_sign_column = 'bg0']]
vim.cmd [[colorscheme gruvbox]]

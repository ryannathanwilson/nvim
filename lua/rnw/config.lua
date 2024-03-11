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
o.background = "dark"

-- use y and p with the system clipboard
o.clipboard = "unnamedplus"

o.laststatus = 3

-- ===================================
-- COLORSCHEME
-- Update LuaLine theme as well
-- ===================================


-- EVERFOREST
-- vim.o.termguicolors = true
-- vim.cmd [[let g:everforest_background = 'hard']]
-- vim.cmd [[let g:everforest_better_performance = 1]]
-- vim.cmd [[let g:everforest_ui_contrast = 1]]
-- vim.cmd [[colorscheme everforest]]

-- ROSE PINE
-- vim.cmd [[colorscheme rose-pine]]

-- DARK MODERN
-- vim.cmd [[colorscheme dark_modern]]

-- TOKYO NIGHT
-- vim.g.tokyonight_style = "night"
-- vim.cmd [[colorscheme tokyonight]]

-- GRUVBOX
vim.cmd [[let g:gruvbox_sign_column = 'bg0']]
vim.cmd [[colorscheme gruvbox]]

-- BLAMER
vim.cmd [[let g:blamer_enabled = 1]]


-- COLORS
vim.cmd [[highlight WinSeparator guibg=NONE]]
vim.cmd [[highlight FloatBorder guibg=none]] -- this line seems broken but required
vim.cmd [[highlight NormalFloat guibg=none]] -- this line seems broken but required

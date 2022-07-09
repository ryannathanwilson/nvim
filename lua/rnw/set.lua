local o = vim.opt
local cmd = vim.api.nvim_command
o.guicursor = nv
o.autoindent = true
o.autoread = true
o.expandtab = true
o.hidden = true
o.errorbells = false
o.hlsearch = false
o.incsearch = true
o.nu = true
o.relativenumber = true
o.scrolloff=8
o.signcolumn = 'number'
o.shiftwidth=2
o.smartindent = true
o.softtabstop=2
o.tabstop=2
o.undofile = true
o.splitbelow = true
o.splitright = true
o.mouse = 'a'

-- use y and p with the system clipboard
o.clipboard = "unnamedplus"

cmd("colorscheme gruvbox")

o.laststatus = 3
cmd([[
highlight WinSeparator guibg=None
]])


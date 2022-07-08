vim.opt.guicursor = nv
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff=8
vim.opt.shiftwidth=2
vim.opt.smartindent = true
vim.opt.softtabstop=2
vim.opt.tabstop=2
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- use y and p with the system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.laststatus = 3
vim.cmd([[
highlight WinSeparator guibg=None
]])


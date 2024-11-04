vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- Indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Esc
vim.keymap.set("i", "jk", "<Esc>")

-- Window management
vim.keymap.set("n", "<leader><leader>", "<cmd>wincmd w<CR>")
vim.keymap.set("n", "<C-W>", "<cmd>wincmd w<CR>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Previous file toggle
vim.keymap.set("n", "<leader>l", "<C-t><CR>")
vim.keymap.set("n", "^", "<C-o><CR>")

-- Next buffer
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>")

-- Delete current buffer
vim.keymap.set("n", "<leader>cc", "<cmd>bd<CR>")

-- Print path of current buffer
vim.keymap.set("n", "<leader>pwd", '<cmd>echo expand("#1:p")<CR>')

-- GIT

vim.keymap.set("n", "<leader>gs", "<cmd>tab Git<CR>")
-- vim.keymap.set('n', '<leader>gs', '<cmd>LazyGit<CR>')

-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
-- vim.keymap.set("n", "<leader>ha", mark.add_file)
-- vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu)
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.background = "dark"

-- use y and p with the system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.laststatus = 3

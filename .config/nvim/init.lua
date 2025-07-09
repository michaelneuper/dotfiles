vim.cmd.colorscheme('gruvbox')

vim.o.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.hlsearch = false

vim.g.mapleader = vim.keycode('<Space>')
vim.keymap.set("n", "<leader>fs", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true })

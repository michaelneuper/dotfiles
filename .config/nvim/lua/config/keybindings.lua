vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fs", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true, silent = true })
vim.keymap.set({ "i", "v", "c" }, "<C-g>", "<Esc>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>ot", ":botright split | resize 10 | terminal<CR>",{
--     noremap = true, silent = true, desc = "Open terminal"
-- })

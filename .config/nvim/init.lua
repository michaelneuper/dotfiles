-- OPTIONS
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

-- auto remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- PACKAGE MANAGER
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  { "ellisonleao/gruvbox.nvim" },
  { "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim"
    } },
  { "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    } },
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate" },
  { "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true },
})

-- vim.pack.add( {
--     "ellisonleao/gruvbox.nvim",
--     "nvim-lualine/lualine.nvim",
--     "nvim-lua/plenary.nvim",
--     "nvim-telescope/telescope.nvim",
--     "nvim-tree/nvim-web-devicons",
--     "nvim-treesitter/nvim-treesitter",
--     "windwp/nvim-autopairs",
-- })

-- KEYBINDINGS
vim.g.mapleader = vim.keycode("<Space>")

vim.keymap.set("n", "<leader>fs", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true, silent = true })
vim.keymap.set({ "i", "v", "c" }, "<C-g>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ot", ":botright split | resize 10 | terminal<CR>",{
  noremap = true, silent = true, desc = "Open terminal"
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })

-- UI
vim.opt.termguicolors = true

require("gruvbox").setup({
  terminal_colors = false,

  underline = true,
  italic = {
    strings = false,
    comments = true,
    folds = true,
  },
})

vim.cmd.colorscheme("gruvbox")

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = { "location", "progress" },

    lualine_x = { "encoding", "filetype" },
    lualine_y = { "diff" },
    lualine_z = { "branch" },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = { "filename" },
    lualine_c = { "location" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {},
  extensions = {},
})

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
        vim.keymap.set("n", "<leader>sb", builtin.live_grep, { desc = "Search Buffer" })
        vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Switch Buffer" })
    end
}

return {
    "ellisonleao/gruvbox.nvim",
    config = function()
        vim.cmd.colorscheme("gruvbox")

        require("gruvbox").setup({
            terminal_colors = false,
            underline = true,
            italic = {
                strings = false,
                comments = true,
                folds = true,
            },
        })
    end
}

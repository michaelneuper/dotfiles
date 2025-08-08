return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = false,
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
    end
}

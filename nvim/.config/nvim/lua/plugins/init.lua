return {
    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("catppuccin").setup({
                flavor = "macchiato",
                auto_integrations = true,
            })
            vim.cmd([[colorscheme catppuccin]])
        end,
    },

    -- Emmet
    "mattn/emmet-vim",

    -- Change surrounding symbols
    {
        "tpope/vim-surround",
        event = "VeryLazy",
    },

    -- Highlight colors
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    },
}

return {
    -- Various colorschemes
    "flazz/vim-colorschemes",
    "w0ng/vim-hybrid",

  {
        "rebelot/kanagawa.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme kanagawa]])
        end,
    },

    -- Emmet
    "mattn/emmet-vim",

    -- Commenting
    "tpope/vim-commentary",

    -- Change surrounding symbols
    "tpope/vim-surround",

    -- Detect indentation
    "tpope/vim-sleuth",

    -- Git stuff
    "tpope/vim-fugitive",

    -- Highlight colors
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({})
        end,
    },
}

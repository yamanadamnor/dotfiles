return {
    -- Various colorschemes
    "flazz/vim-colorschemes",
    "w0ng/vim-hybrid",

    -- Colorscheme
    {
        "rebelot/kanagawa.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require("kanagawa").setup({
                transparent = true,
                theme = "dark",
                overrides = function()
                    return {
                        TelescopeBorder = { default = true, link = "TelescopeNormal" },
                        TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
                        TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
                        TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
                    }
                end,
            })
            vim.cmd([[colorscheme kanagawa]])
        end,
    },

    -- Emmet
    "mattn/emmet-vim",

    -- Commenting
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end
    },

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

    -- VimTeX
    "lervag/vimtex",

    -- Caddyfile support
    "isobit/vim-caddyfile"
}

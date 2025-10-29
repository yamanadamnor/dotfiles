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

  -- Comment support for TSX support
  {

    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },

  -- Change surrounding symbols
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

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
  -- Caddyfile support
  "isobit/vim-caddyfile",
}

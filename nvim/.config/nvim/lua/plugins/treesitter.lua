return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "dockerfile",
        "python",
        "go",
        "json5",
        "jsonc",
        "javascript",
        "gomod",
        "html",
        "latex",
        "lua",
        "markdown",
        "php",
        "prisma",
        "rust",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  -- Auto close and rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
}

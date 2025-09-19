-- Never request typescript-language-server for formatting
vim.lsp.buf.format {
  filter = function(client) return client.name ~= "ts_ls" end
}

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
          },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    -- LSP server helpers
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tailwindcss",
          "ts_ls",
          "biome"
        },
        automatic_installation = true,
        automatic_enable = true,
      })
    end,
  },
  {
    -- Neovim lua autocompletion
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}

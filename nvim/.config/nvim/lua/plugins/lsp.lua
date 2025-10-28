-- Never request typescript-language-server for formatting
vim.lsp.buf.format {
  filter = function(client) return client.name ~= "ts_ls" end
}

return {
  {
    "neovim/nvim-lspconfig",
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

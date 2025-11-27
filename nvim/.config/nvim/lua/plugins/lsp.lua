-- Never request typescript-language-server for formatting
local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },

  offsetEncoding = { "utf-16" },
  general = {
    positionEncodings = { "utf-16" },
  },
}
local on_attach = function(client, bufnr)
  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<C-j>", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end)
end

vim.lsp.config("*",
  --- @type vim.lsp.Config
  {
    on_attach = on_attach,
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities),
  }
)

vim.lsp.enable({
  "lua_ls",
  "ts_ls",
  "tailwindcss",
  "biome",
})

return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog", "MasonUninstall", "MasonUninstallAll" },
    config = function()
      require("mason").setup({})
    end,
  },
  {
    -- LSP server helpers
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "tailwindcss",
        "ts_ls",
        "biome"
      },
      automatic_enable = false,
    },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tailwindcss",
          "ts_ls",
          "biome",
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

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fo",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format buffer or range in visual mode",
    },
  },

  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },

      json = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },

      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },

      javascript = { { "prettier", "prettierd" } },
      typescript = { { "prettier", "prettierd" } },
      javascriptreact = { { "prettier", "prettierd" } },
      typescriptreact = { { "prettier", "prettierd" } },
    },

    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },

  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

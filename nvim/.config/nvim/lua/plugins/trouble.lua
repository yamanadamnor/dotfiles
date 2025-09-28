local M = {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "Trouble",
}

function M.keys() end

function M.config()
  require("trouble").setup({
    modes = {
      mydiags = {
        mode = "diagnostics", -- inherit from diagnostics mode
        filter = {
          any = {
            buf = 0,                                    -- current buffer
            {
              severity = vim.diagnostic.severity.ERROR, -- errors only
              -- limit to files in the current project
              function(item)
                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
              end,
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>ft",
        "<cmd>Trouble todo keywords=TODO,FIX,FIXME<cr>",
        desc = "TODOs (Trouble)",
      }
    }
  })
end

return M

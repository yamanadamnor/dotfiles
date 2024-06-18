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
            buf = 0, -- current buffer
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
  })
end

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)

return M

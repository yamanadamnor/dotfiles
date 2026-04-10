local M = {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "Trouble",
  opts = {},
  ---@type table<string, trouble.Action.spec|false>
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
}

return M

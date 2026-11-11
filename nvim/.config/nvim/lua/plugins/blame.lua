local M = {
  "FabijanZulj/blame.nvim",
  lazy = true,
  config = function()
    require("blame").setup({})
  end,
}

return M

local M = {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    --Please make sure you install markdown and markdown_inline parser
    "nvim-treesitter/nvim-treesitter",
  },
}

function M.config()
  require("lspsaga").setup({
    outline = {

      layout = "float",
    },
    -- lightbulb = {
    --   sign = false,
    -- },
  })
end

return M

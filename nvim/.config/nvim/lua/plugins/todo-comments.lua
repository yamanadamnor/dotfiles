local M = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

vim.keymap.set("n", "]j", function()
  require("todo-comments").jump_next({ keywords = { "FIXME", "TODO" } })
end, { desc = "Next TODO/FIXME comment" })

function M.config()
  require("todo-comments").setup({})
end

return M

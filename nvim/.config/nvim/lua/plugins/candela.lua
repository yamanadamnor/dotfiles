local M = {
  "KieranCanter/candela.nvim",
  opts = {},
}

vim.keymap.set("n", "<leader>cds", "<Plug>CandelaUi", {
  desc = "[Candela] toggle UI window",
  silent = true,
})

vim.keymap.set("n", "<leader>cda", "<Plug>CandelaAdd", {
  desc = "[Candela] add pattern in UI",
  silent = true,
})

vim.keymap.set("n", "<leader>cdR", "<Plug>CandelaRefresh", {
  desc = "[Candela] refresh patterns in current buffer",
  silent = true,
})

vim.keymap.set("n", "<leader>cdD", "<Plug>CandelaClear", {
  desc = "[Candela] clear all patterns",
  silent = true,
})

vim.keymap.set("n", "<leader>cdM", "<Plug>CandelaMatchAll", {
  desc = "[Candela] vim match all patterns",
  silent = true,
})

vim.keymap.set("n", "<leader>cdF", "<Plug>CandelaFindAll", {
  desc = "[Candela] find all patterns and send to location list",
  silent = true,
})

vim.keymap.set("n", "<leader>cdL", "<Plug>CandelaLightbox", {
  desc = "[Candela] toggle lightbox window",
  silent = true,
})

vim.keymap.set("n", "<leader>cd?", "<Plug>CandelaHelp", {
  desc = "[Candela] open help menu",
  silent = true,
})

return M

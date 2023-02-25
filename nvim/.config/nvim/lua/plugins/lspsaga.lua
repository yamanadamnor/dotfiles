local M = {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" },
    },
}

function M.config()
    require("lspsaga").setup({})
end

local opts = { silent = true }

vim.keymap.set("n", "<C-a>", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>")
vim.keymap.set("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>")
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "gR", "<Cmd>Lspsaga rename<CR>")

return M

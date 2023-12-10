local M = {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        --Please make sure you install markdown and markdown_inline parser
        "nvim-treesitter/nvim-treesitter"
    },
}

function M.config()
    require("lspsaga").setup({
        lightbulb = {
            sign = false
        }
    })
end

local opts = { silent = true }

vim.keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")
vim.keymap.set("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>")
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
vim.keymap.set("n", "<leader>re", "<Cmd>Lspsaga rename<CR>")
vim.keymap.set("n", "<C-j>", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "<C-J>", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

return M

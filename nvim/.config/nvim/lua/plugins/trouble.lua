local M = {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
    require("trouble").setup({})
end

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end, opts)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, opts)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end, opts)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end, opts)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end, opts)

return M

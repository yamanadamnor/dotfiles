-- using packer.nvim
local M = {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
    require("bufferline").setup({
        options = {
            diagnostics = "nvim_lsp",
        },
    })
end

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

return M
